# set-option global grepcmd 'rg --hidden --follow --smart-case --with-filename --column'

hook global WinSetOption filetype=(svelte|javascript|typescript|css|scss|json|markdown|yaml|html) %{
    set-option buffer formatcmd "prettier --stdin-filepath=%val{buffile}"
    hook buffer -group format BufWritePre .* format
}

hook global WinSetOption filetype=markdown|asciidoc %{
    set-option window lintcmd "proselint"
    hook buffer -group format BufWritePost .* lint
    hook buffer -group format ModeChange .* lint
}
