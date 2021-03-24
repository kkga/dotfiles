map global normal '#'     ': comment-line<ret>'
map global normal <left>  ': bp<ret>'
map global normal <right> ': bn<ret>'

map global user -docstring 'clip-paste (before)'      p      'o<esc>!wl-paste|dos2unix<ret><a-d>'
map global user -docstring 'clip-paste (after)'       P      'O<esc><a-!>wl-paste|dos2unix<ret><a-d>'
map global user -docstring 'clip-replace'             R      '|wl-paste|dos2unix<ret>'
map global user -docstring 'clip-yank'                y      '<a-|>wl-copy<ret>'
map global user -docstring 'save buffer'              w      ': w<ret>'
map global user -docstring 'close buffer'             c      ': db<ret>'
map global user -docstring 'kill buffer'              C      ': db!<ret>'
map global user -docstring 'save all and exit'        q      ': waq<ret>'
map global user -docstring 'exit without save'        Q      ': q!<ret>'
map global user -docstring 'buffers'                  b      ': buffers<ret>'
map global user -docstring 'files'                    f      ': files<ret>'
map global user -docstring 'edit kakrc'               e      ': e ~/.config/kak/kakrc<ret>'
map global user -docstring 'lsp hover'                h      ': lsp-hover<ret>'
map global user -docstring 'codepoint'                i      ': echo %sh{ printf "codepoint: U+%04x" "$kak_cursor_char_value" }<ret>'
map global user -docstring 'surround'                 s      ': enter-user-mode surround<ret>'
map global user -docstring 'select down'              V      ': vertical-selection-down<ret>'
map global user -docstring 'select up'                <a-v>  ': vertical-selection-up<ret>'
map global user -docstring 'select up and down'       v      ': vertical-selection-up-and-down<ret>'
map global user -docstring 'new terminal in cwd'      n      ': kitty-terminal zsh<ret>'
map global user -docstring 'disable autoformat'       d      ': disable-autoformat<ret>'
map global user -docstring 'LSP mode'                 l      ': enter-user-mode lsp<ret>'

# autocomplete with tab
hook global InsertCompletionShow .* %{ map window insert <tab> <c-n> }
hook global InsertCompletionShow .* %{ map window insert <s-tab> <c-p> }
hook global InsertCompletionHide .* %{ map window insert <tab> <tab> }
