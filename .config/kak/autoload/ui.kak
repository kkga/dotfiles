colorscheme lucius

set-option global tabstop 4
set-option global indentwidth 4
set-option global scrolloff 1,3
set-option global ui_options ncurses_status_on_top=true ncurses_assistant=cat

# modeline
define-command update-status %{ evaluate-commands %sh{
  printf %s 'set-option buffer modelinefmt %{'
  if [ "$kak_opt_lsp_diagnostic_error_count" -ne 0 ]; then
    printf %s '{DiagnosticError}%opt{lsp_diagnostic_error_count}!{Default} '
  fi
  if [ "$kak_opt_lsp_diagnostic_warning_count" -ne 0 ]; then
    printf %s '{DiagnosticWarning}%opt{lsp_diagnostic_warning_count}!{Default} '
  fi
  printf %s '{{context_info}} {{mode_info}}'
  printf %s ' · %val{bufname} [%opt{filetype}]'
  printf %s ' · %val{cursor_line}:%val{cursor_char_column}/%val{buf_line_count}'
  case "$kak_client" in client*) ;; *) printf %s " · $kak_client";; esac
  case "$kak_session" in ''|*[!0-9]*) printf %s " @$kak_session";; esac
  printf %s '}'
}}
hook global WinDisplay .* update-status
hook global BufSetOption lsp_diagnostic_error_count=.* update-status
hook global BufSetOption lsp_diagnostic_warning_count=.* update-status

add-highlighter global/ number-lines -hlcursor
add-highlighter global/ regex \h+$ 0:Error
add-highlighter global/ wrap -word -indent
add-highlighter global/ show-matching
