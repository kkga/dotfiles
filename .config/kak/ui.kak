# ui settings
colorscheme lucius-custom
set-option global tabstop 4
set-option global indentwidth 4
set-option global scrolloff 8,4
set-option global ui_options ncurses_status_on_top=true ncurses_assistant=none
add-highlighter global/ number-lines -hlcursor -separator ' '
add-highlighter global/ regex \h+$ 0:Error
add-highlighter global/ wrap -word -indent
add-highlighter global/ show-matching
add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:default+rb

# modeline
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
    printf %s ' · %val{cursor_line}:%val{cursor_char_column}/%val{buf_line_count}'
    printf %s ' {{context_info}} {{mode_info}}'
    printf %s " · {meta}$kak_client{default}@{attribute}$kak_session"
    printf %s '}'
}}
hook global WinDisplay .* update-status
hook global BufSetOption lsp_diagnostic_error_count=.* update-status
hook global BufSetOption lsp_diagnostic_warning_count=.* update-status

# buffers
hook global WinDisplay .* info-buffers
alias global bd delete-buffer
alias global bf buffer-first
alias global bl buffer-last
alias global bo buffer-only
alias global bo! buffer-only-force

# find files
define-command find -docstring "find a file in cwd" -params 1 -menu -shell-script-candidates %{
    fd --type file
    } %{ edit %arg{1} }
alias global f find
