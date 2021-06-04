# global -------------------------------------------------------------

# ambiguous keys
map global insert '<c-h>' <backspace>
map global normal '<c-i>' <tab>

# map -docstring 'Alternate buffer' global normal <c-a> ga
# map -docstring 'Quit' global normal <c-q> ':quit<ret>'
# map -docstring 'Save buffer' global normal <c-w> ':write<ret>'

# work around some weird defaults
map global normal a	   		'li'
map global normal x    		'<a-x>'
# map global normal c    		'<a-c>'
# map global normal <a-c>		'c'
# map global normal d    		'<a-d>'
# map global normal <a-d>		'd'

# select full lines
map global normal J    		'J<a-x>'
map global normal K    		'K<a-x>'

# search case-insensitive
map global normal /    		'/(?i)'
map global normal ?    		'?(?i)'
map global normal <a-/>		'<a-/>(?i)'
map global normal <a-?>		'<a-?>(?i)'

# navigate by paragraphs
map global normal <c-n> 	']p;'
map global normal <c-p> 	'[p;'

# ciao macros: q, w and e are now together
map global normal ^     	'q'
map global normal <a-^> 	'Q'
map global normal q     	'b'
map global normal Q     	'B'
map global normal <a-q> 	'<a-b>'

# readline
map global insert <c-w> 	'<esc>bdi'
map global insert <c-u> 	'<esc>xdO'

# move lines
map global normal <down>	': move-line-below<ret>'
map global normal <up>  	': move-line-above<ret>'

# buffers
map global normal b     	': enter-buffers-mode<ret>'
map global normal B     	': enter-user-mode -lock buffers<ret>'

# format & comment
map global normal =     	': format<ret>'
map global normal '#'   	': comment-line<ret>'
map global normal <a-#> 	': comment-block<ret>'

# jj to exit
hook global InsertChar j %{ try %{
  exec -draft hH <a-k>jj<ret> d
  exec <esc>
}}

# autocomplete with tab
hook global InsertCompletionShow .* %{ map window insert <tab> <c-n> }
hook global InsertCompletionHide .* %{ map window insert <tab> <tab> }
hook global InsertCompletionShow .* %{ map window insert <s-tab> <c-p> }

# tools
map global normal -docstring 'popup'               <+>   ': connect-popup<ret>'
map global normal -docstring 'terminal'            <c-t> ': connect-terminal<ret>'
map global normal -docstring 'files'               <c-f> ': + kcr-fzf-files<ret>'
map global normal -docstring 'buffers'             <c-b> ': + kcr-fzf-buffers<ret>'
map global normal -docstring 'files by content'    <c-g> ': + kcr-fzf-grep<ret>'
map global normal -docstring 'lines in buffer'     <c-k> ': + kcr-fzf-lines %val{buffile}<ret>'
map global normal -docstring 'lf'                  <c-h> ': > lf -command "set nopreview; set ratios 1" .<ret>'
map global normal -docstring 'lazygit'             <c-l> ': + lazygit<ret>'

# user ---------------------------------------------------------------

# clipboard
evaluate-commands %sh{
    case $(uname) in
        Linux) copy="wl-copy"; paste="wl-paste" ;;
        Darwin)  copy="pbcopy"; paste="pbpaste" ;;
    esac
    printf "map global user -docstring 'clip-paste (after)' p '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'clip-paste (before)' P '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'clip-yank' y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection clipboard}<ret>'\n" "$copy"
    printf "map global user -docstring 'clip-replace' R '|%s<ret>'\n" "$paste"
}

# tools
map global user -docstring 'surround mode'         s ': enter-user-mode surround<ret>'
map global user -docstring 'LSP mode'              l ': enter-user-mode lsp<ret>'
map global user -docstring 'tree mode'             t ': enter-user-mode tree<ret>'
map global user -docstring 'tree mode (lock)'      T ': enter-user-mode -lock tree<ret>'

# ui options
map global user -docstring 'toggle line numbers'   L ': toggle-highlighter global/ number-lines -hlcursor<ret>'
map global user -docstring 'toggle wrap'           W ': toggle-highlighter global/ wrap -word <ret>'

# tree mode
declare-user-mode tree
map global tree -docstring 'parent'                h ': tree-select-parent-node<ret>'
map global tree -docstring 'child'                 l ': tree-select-first-child<ret>'
map global tree -docstring 'children'              L ': tree-select-children<ret>'
map global tree -docstring 'next'                  j ': tree-select-next-node<ret>'
map global tree -docstring 'prev'                  k ': tree-select-previous-node<ret>'
map global tree -docstring 'info'                  i ': tree-node-sexp<ret>'
