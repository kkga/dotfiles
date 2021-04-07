# global mappings
# ---------------

# jj to exit
hook global InsertChar j %{ try %{
  exec -draft hH <a-k>jj<ret> d
  exec <esc>
}}

# navigate by paragraphs
map global normal <c-n> ']p;'
map global normal <c-p> '[p;'

# ciao macros: q, w and e are now together
map global normal ^ q
map global normal <a-^> Q

map global normal q b
map global normal Q B
map global normal <a-q> <a-b>
map global normal <a-Q> <a-B>

# Search case-insensitive by default
map global normal "/" "/(?i)"
map global normal "?" "?(?i)"
map global normal "<a-/>" "<a-/>(?i)"
map global normal "<a-?>" "<a-?>(?i)"

map global normal -docstring 'move selected lines below' <down>  ': move-line-below<ret>'
map global normal -docstring 'move selected lines above' <up>    ': move-line-above<ret>'

map global normal -docstring 'buffers…       '           b       ': enter-buffers-mode<ret>'
map global normal -docstring 'buffers (lock)…'           B       ': enter-user-mode -lock buffers<ret>'

map global normal -docstring 'format buffer'             =       ': format<ret>'
map global normal -docstring 'comment line'              '#'     ': comment-line<ret>'
map global normal -docstring 'comment block'             '<a-#>' ': comment-block<ret>'

# autocomplete with tab
hook global InsertCompletionShow .* %{ map window insert <tab> <c-n> }
hook global InsertCompletionHide .* %{ map window insert <tab> <tab> }
hook global InsertCompletionShow .* %{ map window insert <s-tab> <c-p> }

# space to leader
# map global normal -docstring 'leader'                        <space> ,
# map global normal -docstring 'remove all sels except main'   <backspace> <space>
# map global normal -docstring 'remove main sel'               <a-backspace> <a-space>


# user mappings
# -------------

# clipboard
evaluate-commands %sh{
    case $(uname) in
        Linux) copy="wl-copy"; paste="wl-paste" ;;
        Darwin)  copy="pbcopy"; paste="pbpaste" ;;
    esac
    printf "map global user -docstring 'paste (after) from clipboard' p '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'paste (before) from clipboard' P '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'yank to clipboard' y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection clipboard}<ret>'\n" "$copy"
    printf "map global user -docstring 'replace from clipboard' R '|%s<ret>'\n" "$paste"
}

# ui options
map global user -docstring 'toggle numbers'        L ': toggle-highlighter global/ number-lines -hlcursor<ret>'
map global user -docstring 'toggle wrap'           W ': toggle-highlighter global/ wrap -word <ret>'

# buffer
map global user -docstring 'write'                 w ': w<ret>'
map global user -docstring 'quit'                  q ': q<ret>'
map global user -docstring 'QUIT'                  Q ': q!<ret>'

# search
map global user -docstring 'find buffers'          b ': + kcr-fzf-buffers<ret>'
map global user -docstring 'find files'            f ': + kcr-fzf-files<ret>'
map global user -docstring 'find configs'          e ': + kcr-fzf-files /home/kkga/.config/<ret>'
map global user -docstring 'find notes'            n ': + kcr-fzf-files /home/kkga/notes/<ret>'
map global user -docstring 'grep'                  g ': + kcr-fzf-grep<ret>'
map global user -docstring 'grep buffer'           G ': + kcr-fzf-grep %val{buffile}<ret>'

# tools
map global user -docstring 'disable autoformat'    d ': disable-autoformat<ret>'
map global user -docstring 'surround mode'         s ': enter-user-mode surround<ret>'
map global user -docstring 'LSP mode'              l ': enter-user-mode lsp<ret>'
