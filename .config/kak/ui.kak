colorscheme primer

set-option global tabstop 4
set-option global indentwidth 4
set-option global scrolloff 1,3
set-option global ui_options ncurses_status_on_top=true ncurses_assistant=off

# modeline
set-option -add global modelinefmt '%sh{printf "﬘->%s"  $(printf %s\\n $kak_buflist |wc -w) }'

# add-highlighter global/ number-lines -hlcursor
add-highlighter global/ regex \h+$ 0:Error
add-highlighter global/ wrap -word -indent
add-highlighter global/ show-matching
