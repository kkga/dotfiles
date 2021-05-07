# ui --------------------------------------------------------------------------

colorscheme saturn

set-option global tabstop 4
# set-option global indentwidth 4
set-option global scrolloff 4,4
set-option global ui_options ncurses_status_on_top=true
set-option -add global ui_options ncurses_assistant=off
set-option -add global ui_options ncurses_set_title=off
set-option -add global ui_options ncurses_padding_char=╱
set-option -add global ui_options ncurses_padding_fill=yes
set-option global startup_info_version 20200901
set-option global autoreload yes

# add-highlighter global/ wrap -word
add-highlighter global/ number-lines -hlcursor
add-highlighter global/ regex \h+$ 0:Error
add-highlighter global/ show-matching
add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:yellow,black+rb

define-command light-mode %{ evaluate-commands %sh{
  printf 'colorscheme envy'
  alacritty-theme-toggle
}}
define-command dark-mode %{ evaluate-commands %sh{
  printf 'colorscheme saturn'
  alacritty-theme-toggle
}}

# modeline --------------------------------------------------------------------

define-command update-status %{ evaluate-commands %sh{
    printf %s 'set-option buffer modelinefmt %{'
    if [ "$kak_opt_lsp_diagnostic_error_count" -ne 0 ]; then
        printf %s '{DiagnosticError}*%opt{lsp_diagnostic_error_count}{default} '
    fi
    if [ "$kak_opt_lsp_diagnostic_warning_count" -ne 0 ]; then
        printf %s '{DiagnosticWarning}!%opt{lsp_diagnostic_warning_count}{default} · '
    fi
    printf %s ' %sh{pwd | sed "s|^$HOME|~|"}'
    printf %s ' · %val{bufname} [%opt{filetype}]'
    if [ -f "$kak_buffile" ] && [ ! -w "$kak_buffile" ]; then
        printf %s '{red}[]{default}'
    fi
    printf %s ' · %val{cursor_line}:%val{cursor_char_column}/%val{buf_line_count}'
    printf %s ' {{context_info}} {{mode_info}}'
    printf %s " · {meta}$kak_client{default}@{attribute}$kak_session"
    printf %s '}'
}}

hook global WinDisplay .* update-status
hook global BufSetOption lsp_diagnostic_error_count=.* update-status
hook global BufSetOption lsp_diagnostic_warning_count=.* update-status
