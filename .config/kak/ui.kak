# ui --------------------------------------------------------------------------

colorscheme saturn

set-option global tabstop 4
set-option global indentwidth 4
set-option global scrolloff 4,4
set-option global startup_info_version 20200901
set-option global autoreload yes
set-option global lsp_auto_highlight_references false
set-option global lsp_hover_anchor true
set-option -add global ui_options ncurses_status_on_top=true
set-option -add global ui_options ncurses_assistant=off
set-option -add global ui_options ncurses_set_title=off
set-option -add global ui_options ncurses_padding_char=╱
set-option -add global ui_options ncurses_padding_fill=yes

# add-highlighter global/ wrap -word
# add-highlighter global/ number-lines -hlcursor
# add-highlighter global/ show-whitespaces
# add-highlighter global/ show-matching
# add-highlighter global/ regex \h+$ 0:Error
# add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:yellow,black+rb

set-option -add global ui_line_numbers_flags -hlcursor
set-option -add global ui_line_numbers_flags -separator " "
set-option -add global ui_whitespaces_flags -tab "»"
set-option -add global ui_whitespaces_flags -lf "↲"
set-option -add global ui_whitespaces_flags -nbsp "␣"
set-option -add global ui_whitespaces_flags -spc "·"

hook global WinCreate .* %{
    ui-line-numbers-toggle
    ui-whitespaces-toggle
    ui-trailing-spaces-toggle
    ui-cursorline-toggle
    ui-matching-toggle
}

# windowing
hook -group windowing-detection global ClientCreate '.*' %{
    evaluate-commands %sh{
        [ "$WAYLAND_DISPLAY" ] && {
            echo alias global terminal foot-terminal
            echo alias global popup foot-terminal-popup
        }
    }
}
hook -group terminal global ModuleLoaded kitty %{
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
define-command find-edit -params 1 -shell-script-candidates 'rg --files' -docstring 'Find and edit' %{
    edit %arg{1}
}
alias global f find-edit

define-command find-edit-all -params 1 -shell-script-candidates 'rg --files --hidden' -docstring 'Find all and edit' %{
    edit %arg{1}
}
alias global fa find-edit-all

# modeline --------------------------------------------------------------------

define-command update-status %{ evaluate-commands %sh{
    printf %s 'set-option buffer modelinefmt %{'
        if [ "$kak_opt_lsp_diagnostic_error_count" -ne 0 ]; then printf %s '{red+b}*%opt{lsp_diagnostic_error_count}{default} '; fi
        if [ "$kak_opt_lsp_diagnostic_warning_count" -ne 0 ]; then printf %s '{yellow+b}!%opt{lsp_diagnostic_warning_count} {Whitespace}│{default} '; fi
        printf %s ' {Whitespace}[{default}%sh{pwd | sed "s|^$HOME|~|"}{Whitespace}]{default}'
        printf %s ' {Whitespace}[{default}%val{bufname}{comment}(%opt{filetype}){default}'
        if [ -f "$kak_buffile" ] && [ ! -w "$kak_buffile" ]; then printf %s '{red}[]{default}'; fi
        printf %s ' %val{cursor_line}{comment}:{default}%val{cursor_char_column}/%val{buf_line_count} {{context_info}} {{mode_info}}{Whitespace}]{default}'
        printf %s " {Whitespace}[{default}{meta}$kak_client{comment}@{attribute}$kak_session{Whitespace}]{default}"
    printf %s '}'
}}

hook global WinDisplay .* update-status
hook global BufSetOption lsp_diagnostic_error_count=.* update-status
hook global BufSetOption lsp_diagnostic_warning_count=.* update-status
