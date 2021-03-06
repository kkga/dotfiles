# normal -------------------------------------------------------------

# work around some weird defaults
map global normal a         'li'
map global normal x         '<a-x>'
# map global normal c           '<a-c>'
# map global normal <a-c>       'c'
# map global normal d           '<a-d>'
# map global normal <a-d>       'd'

# repurpose visual mode keys for object selection
map global normal <a-v>     'v'
map global normal <a-V>     'V'
map global normal v         '<a-i>'
map global normal V         '<a-a>'

# select full lines
# map global normal J         'J<a-x>'
# map global normal K         'K<a-x>'

# search case-insensitive
map global normal /         '/(?i)'
map global normal ?         '?(?i)'
map global normal <a-/>     '<a-/>(?i)'
map global normal <a-?>     '<a-?>(?i)'

# navigate by paragraphs
map global normal <c-n>     ']p;'
map global normal <c-p>     '[p;'

# ciao macros: q, w and e are now together
map global normal ^         'q'
map global normal <a-^>     'Q'
map global normal q         'b'
map global normal Q         'B'
map global normal <a-q>     '<a-b>'
map global normal w         ': select-next-word<ret>'

# move lines
map global normal <down>    ': move-lines-down<ret>'
map global normal <up>      ': move-lines-up<ret>'

map global normal "'"       ': enter-user-mode surround<ret>'

# inc-dec
map global normal <c-a>     ': inc-dec %val{count} + 0<ret>'
map global normal <c-x>     ': inc-dec %val{count} - 0<ret>'

# buffers
map global normal b         ': enter-buffers-mode<ret>'
map global normal B         ': enter-user-mode -lock buffers<ret>'

# format & comment
map global normal =         ': format<ret>'
map global normal '#'       ': comment-line<ret>'
map global normal <a-#>     ': comment-block<ret>'

# selection
# auto-select word under cursor and put it to / register
define-command word-auto-select -hidden -params 1 -docstring 'auto-select a word under cursor' %{
    try %{ evaluate-commands %sh{
        if echo "$kak_selections_desc" | grep -Eq '^(([0-9]+)\.([0-9]+),\2\.\3:?)+$'; then
          echo execute-keys '<a-i>w<ret>'
        fi
    } }
    execute-keys -save-regs '' -with-hooks %arg{1}
}
map global normal '*'       ': word-auto-select *<ret>'
map global normal '<a-*>'   ': word-auto-select <lt>a-*><ret>'
map global normal <a-percent> ': select-highlights<ret>' -docstring 'select all occurrences of current selection'
map global normal S ': select-objects<ret>'


# save and quit
map global normal '<c-w>'   ':write; echo -markup "{Information}buffer saved"<ret>'
map global normal '<c-q>'   ':quit<ret>'

# tools
map global normal <+>   ': connect-popup<ret>'                                -docstring 'popup'
map global normal <c-t> ': connect-terminal<ret>'                             -docstring 'terminal'
map global normal <c-f> ': + kcr-fzf-files<ret>'                              -docstring 'files'
map global normal <c-b> ': + kcr-fzf-buffers<ret>'                            -docstring 'buffers'
map global normal <c-g> ': + kcr-fzf-grep<ret>'                               -docstring 'files by content'
map global normal <c-l> ': + kcr-fzf-lines %val{buffile}<ret>'                -docstring 'lines in buffer'
map global normal <c-r> ': + kcr-fzf-mru<ret>'                                -docstring 'recent files'
map global normal <c-h> ': > lf -command "set nopreview; set ratios 1" .<ret>'-docstring 'lf'
map global normal <c-v> ': + lazygit<ret>'                                    -docstring 'lazygit'

# object  ----------------------------------------------------------

map global object v '<esc>: vertical-selection-up-and-down<ret>' -docstring 'vertical-selection'

# insert -------------------------------------------------------------

# jk/kj to exit
hook global InsertChar k %{ try %{
  exec -draft hH <a-k>jk<ret> d
  exec <esc>
}}
hook global InsertChar j %{ try %{
  exec -draft hH <a-k>kj<ret> d
  exec <esc>
}}

# readline
map global insert <c-h>     '<backspace>'
map global insert <c-w>     '<esc>bdi'
map global insert <c-u>     '<esc>xdO'

# indentation
map global insert <tab>     '<a-;><a-gt>'
map global insert <s-tab>   '<a-;><lt>'

# autocomplete with tab
hook global InsertCompletionShow .* %{ map window insert <tab> <c-n> }
hook global InsertCompletionHide .* %{ map window insert <tab> '<a-;><a-gt>' }
hook global InsertCompletionShow .* %{ map window insert <s-tab> <c-p> }
hook global InsertCompletionHide .* %{ map window insert <s-tab> '<a-;><lt>' }

# user ---------------------------------------------------------------

# system clipboard
evaluate-commands %sh{
    case $(uname) in
        Linux) copy="wl-copy"; paste="wl-paste --no-newline" ;;
        Darwin)  copy="pbcopy"; paste="pbpaste" ;;
    esac
    printf "map global user -docstring 'clip-paste (after)'   p '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'clip-paste (before)'  P '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'clip-yank'            y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection clipboard}<ret>'\n" "$copy"
    printf "map global user -docstring 'clip-replace'         R '|%s<ret>'\n" "$paste"

}

map global user -docstring 'LSP mode'              l ': enter-user-mode lsp<ret>'
map global user -docstring 'LSP mode (lock)'       L ': enter-user-mode -lock lsp<ret>'
map global user -docstring 'tree mode (lock)'      t ': enter-user-mode -lock tree<ret>'
map global user -docstring 'inc-dec mode (lock)'   i ': enter-user-mode -lock inc-dec<ret>'
map global user -docstring 'UI mode'               u ': enter-user-mode -lock ui<ret>'

# tree mode
declare-user-mode tree
map global tree -docstring 'parent'                h ': tree-select-parent-node<ret>'
map global tree -docstring 'child'                 l ': tree-select-first-child<ret>'
map global tree -docstring 'children'              L ': tree-select-children<ret>'
map global tree -docstring 'next'                  j ': tree-select-next-node<ret>'
map global tree -docstring 'prev'                  k ': tree-select-previous-node<ret>'
map global tree -docstring 'info'                  i ': tree-node-sexp<ret>'

# inc-dec.kak
declare-user-mode inc-dec
map global inc-dec a ': inc-dec %val{count} + 0<ret>' -docstring "increment by count"
map global inc-dec x ': inc-dec %val{count} - 0<ret>' -docstring "decrement by count"
map global inc-dec A ': inc-dec %val{count} + 1<ret>' -docstring "increment by count times selection index"
map global inc-dec X ': inc-dec %val{count} - 1<ret>' -docstring "decrement by count times selection index"
