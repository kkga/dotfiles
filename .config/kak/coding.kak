eval %sh{kak-lsp --kakoune -s $kak_session}
lsp-enable
lsp-auto-hover-insert-mode-enable

set-option global lsp_auto_highlight_references true

set-option global grepcmd 'rg --hidden --follow --smart-case --with-filename --column'

# autoformatting
hook global WinSetOption filetype=(svelte|javascript|typescript|css|scss|json|markdown|yaml|html) %{
    set-option buffer formatcmd "prettier --stdin-filepath=%val{buffile}"
    hook buffer -group format BufWritePre .* format
}
