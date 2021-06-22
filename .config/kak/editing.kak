set-indent global 2

enable-detect-indent
enable-auto-indent
enable-auto-pairs

# commands -----------------------------------------------------------------------

define-command disable-autoformat -docstring 'disable auto-format' %{
    unset-option buffer formatcmd
    remove-hooks buffer format
}
define-command disable-autolint -docstring 'disable auto-lint' %{
    unset-option buffer lintcmd
    remove-hooks buffer lint
}

# generic hooks ---------------------------------------------------------------

hook global BufOpenFile  .* %{ modeline-parse }
hook global BufCreate    .* %{ try %{ editorconfig-load } }
hook global BufWritePost .* %{ try %{ lint } }
hook global BufWritePre  .* %{ try %{ format-buffer } }
# hook global BufWritePost .* %{ git show-diff }
# hook global BufReload    .* %{ git show-diff }
# hook global ModeChange pop:insert:.* %{ try %{ execute-keys -draft '%s\h+$<ret>d' } }

# cd into current-buffer dir or git dir on file open
hook global WinDisplay   .* %{ evaluate-commands %sh{
    cd "$(dirname "$kak_buffile")"
    project_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
    [ -n "$project_dir" ] && dir="$project_dir" || dir="${PWD%/.git}"
    printf "cd %%{%s}\n" "$dir"
    # [ -n "$project_dir" ] && [ "$kak_buffile" = "${kak_buffile#\*}" ] && printf "git show-diff"
} }

hook global WinSetOption filetype=.* %{
    hook buffer -group format BufWritePre .* %{
        try %{ execute-keys -draft '%s\h+$<ret>d' }
        try %{ execute-keys -draft '%s\u000d<ret>d' }
    }
}

# filetype hooks ---------------------------------------------------------------

hook global WinSetOption filetype=zig %{
    set-option buffer formatcmd 'zig fmt --stdin'
    set-option global lsp_server_configuration zls.zig_lib_path="/usr/lib/zig"
    set-option -add global lsp_server_configuration zls.warn_style=true
    set-option -add global lsp_server_configuration zls.enable_semantic_tokens=true
    hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
    hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
    hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window semantic-tokens
    }
}

hook global WinSetOption filetype=(svelte|css|yaml|html) %{
    set-option buffer formatcmd "prettier --stdin-filepath='%val{buffile}'"
}

hook global WinSetOption filetype=(javascript|typescript) %{
    set-option buffer formatcmd "deno fmt -"
    hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
    hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
    hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window semantic-tokens
    }
}

hook global WinSetOption filetype=json %{
    set-option buffer formatcmd "deno fmt --ext json -"
}

hook global WinSetOption filetype=markdown %{
    require-module todo
    set-option buffer lintcmd "proselint"
    # set-option buffer formatcmd "prettier --prose-wrap=always --stdin-filepath='%val{buffile}'"
    set-option buffer formatcmd "deno fmt --ext md -"
    map buffer normal <ret> ': todo-toggle<ret>' -docstring "toggle checkbox"
    add-highlighter buffer/ regex '\[ \]' 0:blue
    add-highlighter buffer/ regex '\[x\]' 0:comment
}

hook global WinSetOption filetype=lua %{
    set-option buffer formatcmd "stylua -"
}

hook global WinSetOption filetype=sh %{
    set-option buffer formatcmd 'shfmt -ci -sr'
}

hook global WinSetOption filetype=gdscript %{
    set-option buffer formatcmd "gdformat -"
}
