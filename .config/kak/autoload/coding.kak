# set-option global grepcmd 'rg --hidden --follow --smart-case --with-filename --column'

eval %sh{kak-lsp --kakoune -s $kak_session}
hook global WinSetOption filetype=(crystal|html|css|json|rust|python|go|typescript|svelte|javascript) %{
    lsp-auto-hover-enable
    lsp-enable-window
    set-option global lsp_hover_anchor true
}

def -hidden insert-c-n %{
    try %{
        lsp-snippets-select-next-placeholders
        exec '<a-;>d'
    } catch %{
        exec -with-hooks '<c-n>'
    }
}
map global insert <c-n> "<a-;>: insert-c-n<ret>"

hook global WinSetOption filetype=(svelte|javascript|typescript|css|scss|json|markdown|yaml|html) %{
    set-option buffer formatcmd "prettier --stdin-filepath=%val{buffile}"
    hook buffer -group format BufWritePre .* format
}

hook global WinSetOption filetype=markdown|asciidoc %{
    set-option window lintcmd "proselint"
    hook buffer -group format BufWritePost .* lint
    hook buffer -group format ModeChange .* lint
}
