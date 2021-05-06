set-option global grepcmd 'rg --smart-case --column --with-filename'

# lsp -------------------------------------------------------------------------

eval %sh{kak-lsp --kakoune -s $kak_session}
hook global WinSetOption filetype=(crystal|html|css|json|rust|python|go|typescript|svelte|javascript) %{
    lsp-auto-hover-insert-mode-enable
    lsp-enable-window
    set-option global lsp_auto_highlight_references false
    set-option global lsp_hover_anchor true
}
hook global KakEnd .* lsp-exit

hook global WinSetOption filetype=(typescript|javascript) %{
  hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
  hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
  hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
  hook -once -always window WinSetOption filetype=.* %{
    remove-hooks window semantic-tokens
  }
}
# uncomment for lsp debug
# set global lsp_cmd "kak-lsp -s %val{session} -vvv --log /tmp/kak-lsp.log"

define-command lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }
define-command ne -docstring 'go to next error/warning from lsp' %{ lsp-find-error --include-warnings }
define-command pe -docstring 'go to previous error/warning from lsp' %{ lsp-find-error --previous --include-warnings }
define-command ee -docstring 'go to current error/warning from lsp' %{ lsp-find-error --include-warnings; lsp-find-error --previous --include-warnings }

# lsp snippets
def -hidden insert-c-n %{
    try %{
        lsp-snippets-select-next-placeholders
        exec '<a-;>d'
    } catch %{
        exec -with-hooks '<c-n>'
    }
}
map global insert <c-n> "<a-;>: insert-c-n<ret>"


# hooks -----------------------------------------------------------------------

# TODO https://github.com/maximbaz/dotfiles/blob/master/.config/kak/coding.kak
hook global BufOpenFile  .* modeline-parse
hook global BufCreate    .* %{ try %{ editorconfig-load } }
hook global BufWritePost .* %{ git show-diff }
hook global BufReload    .* %{ git show-diff }
# hook global WinCreate    .* %{ manual-indent-enable }

# cd into current-buffer dir or git dir on file open
hook global WinDisplay   .* %{ evaluate-commands %sh{
    cd "$(dirname "$kak_buffile")"
    project_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
    [ -n "$project_dir" ] && dir="$project_dir" || dir="${PWD%/.git}"
    printf "cd %%{%s}\n" "$dir"
    [ -n "$project_dir" ] && [ "$kak_buffile" = "${kak_buffile#\*}" ] && printf "git show-diff"
} }

# formatting and linting
define-command disable-autoformat -docstring 'disable auto-format' %{
	unset-option buffer formatcmd
	remove-hooks buffer format
}
define-command disable-autolint -docstring 'disable auto-lint' %{
	unset-option buffer lintcmd
	remove-hooks buffer lint
}
hook global WinSetOption filetype=.* %{
    # disable-autoformat
    # disable-autolint
    hook buffer -group format BufWritePre .* %{
        try %{ execute-keys -draft '%s\h+$<ret>d' }
        try %{ execute-keys -draft '%s\u000d<ret>d' }
    }
}
hook global WinSetOption filetype=(svelte|javascript|typescript|css|scss|yaml|html) %{
    set-option buffer formatcmd "prettier --stdin-filepath='%val{buffile}'"
    hook buffer -group format BufWritePre .* format
}
hook global WinSetOption filetype=(javascript|typescript) %{
    set-option buffer formatcmd "deno fmt -"
    hook buffer -group format BufWritePre .* format
}
hook global WinSetOption filetype=json %{
    set-option buffer formatcmd "deno fmt --ext json -"
    hook buffer -group format BufWritePre .* format
}
hook global WinSetOption filetype=markdown %{
    set-option buffer lintcmd "proselint"
    set-option buffer formatcmd "deno fmt --ext md -"
    # set-option buffer formatcmd "prettier --prose-wrap=always --stdin-filepath='%val{buffile}'"
    hook buffer -group format BufWritePre .* format
    hook buffer -group format BufWritePost .* lint
}
hook global WinSetOption filetype=lua %{
    set-option buffer formatcmd "stylua -"
    hook buffer -group format BufWritePre .* format
}
hook global WinSetOption filetype=sh %{
    set-option buffer formatcmd 'shfmt -ci -sr'
    hook buffer -group format BufWritePre .* format
}

