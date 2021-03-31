set-option global grepcmd 'rg --smart-case --column --with-filename'

eval %sh{kak-lsp --kakoune -s $kak_session}
hook global WinSetOption filetype=(crystal|html|css|json|rust|python|go|typescript|svelte|javascript) %{
    lsp-auto-hover-enable
    lsp-auto-hover-insert-mode-enable
    lsp-enable-window
    set-option global lsp_auto_highlight_references true
    set-option global lsp_hover_anchor true
}
hook global KakEnd .* lsp-exit

define-command lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }
define-command ne -docstring 'go to next error/warning from lsp' %{ lsp-find-error --include-warnings }
define-command pe -docstring 'go to previous error/warning from lsp' %{ lsp-find-error --previous --include-warnings }
define-command ee -docstring 'go to current error/warning from lsp' %{ lsp-find-error --include-warnings; lsp-find-error --previous --include-warnings }

def -hidden insert-c-n %{
    try %{
        lsp-snippets-select-next-placeholders
        exec '<a-;>d'
    } catch %{
        exec -with-hooks '<c-n>'
    }
}
map global insert <c-n> "<a-;>: insert-c-n<ret>"

# formatting
hook global WinSetOption filetype=(svelte|javascript|typescript|css|scss|json|markdown|yaml|html) %{
    set-option buffer formatcmd "prettier --prose-wrap=always --stdin-filepath='%val{buffile}'"
    hook buffer -group format BufWritePre .* format
}
define-command disable-autoformat -docstring 'disable auto-format' %{
	unset-option buffer formatcmd
	remove-hooks buffer format
}

# linting
hook global WinSetOption filetype=markdown|asciidoc %{
    set-option window lintcmd "proselint"
    # hook buffer -group format BufWritePost .* lint
    # hook buffer -group format InsertIdle .* lint
}
define-command disable-autolint -docstring 'disable auto-lint' %{
	unset-option buffer lintcmd
	remove-hooks buffer lint
}

