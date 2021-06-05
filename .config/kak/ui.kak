# ui --------------------------------------------------------------------------

colorscheme saturn

set-option global tabstop 4
set-option global indentwidth 4
set-option global scrolloff 4,4
set-option global ui_options ncurses_status_on_top=true
set-option global startup_info_version 20200901
set-option global autoreload yes
set-option global lsp_auto_highlight_references false
set-option global lsp_hover_anchor true
set-option -add global ui_options ncurses_assistant=off
set-option -add global ui_options ncurses_set_title=off
set-option -add global ui_options ncurses_padding_char=╱
set-option -add global ui_options ncurses_padding_fill=yes

# add-highlighter global/ wrap -word
# add-highlighter global/ number-lines -hlcursor
# add-highlighter global/ show-whitespaces
add-highlighter global/ regex \h+$ 0:Error
add-highlighter global/ show-matching
add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:yellow,black+rb

# windowing
hook -group windowing-detection global ClientCreate '.*' %{
    evaluate-commands %sh{
        [ "$WAYLAND_DISPLAY" ] && {
            echo alias global terminal foot-terminal
            echo alias global popup foot-terminal-popup
        }
    }
}
hook global ModuleLoaded kitty %{
    alias global terminal kitty-terminal
    alias global popup kitty-terminal
}

# buffers
hook global WinDisplay .* info-buffers

# state-save
hook global KakBegin .* %{
    state-save-reg-load colon
    state-save-reg-load pipe
    state-save-reg-load slash
}
hook global KakEnd .* %{
    state-save-reg-save colon
    state-save-reg-save pipe
    state-save-reg-save slash
}

# find files
define-command find-edit -params 1 -shell-script-candidates 'fd --type file' -docstring 'Edit file' %{
    edit %arg{1}
}
alias global f find-edit

define-command find-edit-all -params 1 -shell-script-candidates 'fd --hidden --no-ignore --type file' -docstring 'Edit file' %{
    edit %arg{1}
}
alias global fa find-edit-all

# modeline --------------------------------------------------------------------

set-option global out_of_view_format '↑%opt{out_of_view_selection_above_count} | ↓%opt{out_of_view_selection_below_count} · '

define-command update-status %{ evaluate-commands %sh{
    printf %s 'set-option buffer modelinefmt %{'
        printf %s '{yellow}%opt{out_of_view_status_line}{default}'
        if [ "$kak_opt_lsp_diagnostic_error_count" -ne 0 ]; then
            printf %s '{red+b}*%opt{lsp_diagnostic_error_count}{default} '
        fi
        if [ "$kak_opt_lsp_diagnostic_warning_count" -ne 0 ]; then
            printf %s '{yellow+b}!%opt{lsp_diagnostic_warning_count}{default} · '
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
