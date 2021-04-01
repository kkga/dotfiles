colorscheme lucius-custom

set-option global tabstop 4
set-option global indentwidth 4
set-option global scrolloff 8,4
set-option global ui_options ncurses_status_on_top=true ncurses_assistant=none

# add-highlighter global/ number-lines -hlcursor
add-highlighter global/ regex \h+$ 0:Error
add-highlighter global/ wrap -word -indent
add-highlighter global/ show-matching
add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:default+rb
add-highlighter global/ regex @\b(todo|fixme|xxx|note)\b 0:default+rb

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
    # case "$kak_client" in client*) ;; *) printf %s " · $kak_client";; esac
    # case "$kak_session" in ''|*[!0-9]*) printf %s " @$kak_session";; esac
    printf %s '}'
}}
hook global WinDisplay .* update-status
hook global BufSetOption lsp_diagnostic_error_count=.* update-status
hook global BufSetOption lsp_diagnostic_warning_count=.* update-status

# evaluate-commands %sh{
#     lsp_errors='{DiagnosticError}*%opt{lsp_diagnostic_error_count}{default}'
#     lsp_warnings='{DiagnosticWarning}!%opt{lsp_diagnostic_warning_count}{default}'
#     cwd='at {cyan}%sh{ pwd | sed "s|^$HOME|~|" }{default}'
#     bufname='in {green}%val{bufname}{default}'
#     modified='{blue+b}%sh{ $kak_modified && echo "[+] " }{default}'
#     ft='as {magenta}%sh{ echo "${kak_opt_filetype:-noft}" }{default}'
#     # eol='with {yellow}%val{opt_eolformat}{default}'
#     cursor='on {cyan}%val{cursor_line}{default}:{cyan}%val{cursor_char_column}{default}'
#     readonly='{red+b}%sh{ [ -f "$kak_buffile" ] && [ ! -w "$kak_buffile" ] && echo "[] " }{default}'
#     echo set global modelinefmt "'${lsp_errors} ${lsp_warnings} {{mode_info}} ${cwd} ${bufname} ${readonly}${modified}${ft} ${cursor}'"
# }

# buffers
hook global WinDisplay .* info-buffers
alias global bd delete-buffer
alias global bf buffer-first
alias global bl buffer-last
alias global bo buffer-only
alias global bo! buffer-only-force
