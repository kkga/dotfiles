# jj to exit
hook global InsertChar j %{ try %{
  exec -draft hH <a-k>jj<ret> d
  exec <esc>
}}

# navigate by paragraphs
map global normal <c-n> ']p;'                                 -docstring 'next paragraph'
map global normal <c-p> '[p;'                                 -docstring 'previous paragraph'

# ciao macros: q, w and e are now together
map global normal ^ q
map global normal <a-^> Q

map global normal q b
map global normal Q B
map global normal <a-q> <a-b>
map global normal <a-Q> <a-B>

map global normal b ':enter-buffers-mode<ret>'              -docstring 'buffers…'
map global normal B ':enter-user-mode -lock buffers<ret>'   -docstring 'buffers (lock)…'

map global normal -docstring 'format buffer'                 =       ': format<ret>'
map global normal -docstring 'comment line'                  '#'     ': comment-line<ret>'
map global normal -docstring 'comment block'                 '<a-#>' ': comment-block<ret>'

map global goto -docstring 'next paragraph' 				 n       '<esc>]p;'
map global goto -docstring 'prev paragraph' 				 p       '<esc>[p;'

# options
map global user -docstring 'toggle number-lines'             L      ': toggle-highlighter global/ number-lines -hlcursor<ret>'
map global user -docstring 'toggle wrap'                     W      ': toggle-highlighter global/ wrap -word <ret>'


# clipboard
evaluate-commands %sh{
    case $(uname) in
        Linux) copy="wl-copy"; paste="wl-paste|dos2unix" ;;
        Darwin)  copy="pbcopy"; paste="pbpaste" ;;
    esac
    printf "map global user -docstring 'paste (after) from clipboard' p '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'paste (before) from clipboard' P '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'yank to clipboard' y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection clipboard}<ret>'\n" "$copy"
    printf "map global user -docstring 'replace from clipboard' R '|%s<ret>'\n" "$paste"
}

# buffer
map global user -docstring 'save buffer'                     w      ': w<ret>'
map global user -docstring 'close buffer'                    c      ': db<ret>'
map global user -docstring 'kill buffer'                     C      ': db!<ret>'
map global user -docstring 'save all and exit'               q      ': waq<ret>'
map global user -docstring 'exit without save'               Q      ': q!<ret>'

# search
define-command explore-files -params .. '+ kcr-fzy-files %arg{@}'
define-command explore-buffers -params .. '+ kcr-fzy-buffers %arg{@}'
map global user -docstring 'buffers'                         b      ': explore-buffers<ret>'
map global user -docstring 'files'                           f      ': explore-files<ret>'
map global user -docstring 'configs'                         e      ': explore-files /home/kkga/.config/<ret>'
map global user -docstring 'notes'                           n      ': explore-files /home/kkga/notes/<ret>'
map global user -docstring 'grep'                            g      ': + kcr-fzy-grep<ret>'
map global user -docstring 'grep buffer'                     G      ': + kcr-fzy-grep %val{buffile}<ret>'
map global user -docstring 'grep notes'                      N      ': + kcr-fzy-grep /home/kkga/notes/<ret>'

# tools
map global user -docstring 'surround'                        s      ': enter-user-mode surround<ret>'
map global user -docstring 'disable autoformat'              d      ': disable-autoformat<ret>'
map global user -docstring 'LSP mode'                        l      ': enter-user-mode lsp<ret>'
map global user -docstring 'codepoint'                       i      ': echo %sh{ printf "codepoint: U+%04x" "$kak_cursor_char_value" }<ret>'

# autocomplete with tab
hook global InsertCompletionShow .* %{ map window insert <tab> <c-n> }
hook global InsertCompletionHide .* %{ map window insert <tab> <tab> }
hook global InsertCompletionShow .* %{ map window insert <s-tab> <c-p> }

