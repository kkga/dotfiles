# tools -------------------------------------------------------------

set-option global grepcmd 'rg --column'

eval %sh{kak-lsp --kakoune -s "$kak_session"}
hook global WinSetOption filetype=(crystal|html|css|json|rust|python|go|typescript|svelte|javascript|elm|zig|gdscript) %{
    lsp-enable-window
    lsp-auto-signature-help-enable
    lsp-auto-hover-insert-mode-enable
}
hook global KakEnd .* lsp-exit

# uncomment for lsp debug
# set global lsp_cmd "kak-lsp -s %val{session} -vvv --log /tmp/kak-lsp.log"

define-command lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }
define-command ne -docstring 'go to next error/warning from lsp' %{ lsp-find-error --include-warnings }
define-command pe -docstring 'go to previous error/warning from lsp' %{ lsp-find-error --previous --include-warnings }
define-command ee -docstring 'go to current error/warning from lsp' %{ lsp-find-error --include-warnings; lsp-find-error --previous --include-warnings }

# lsp snippets
def -hidden insert-c-n %{
    try %{
        lsp-snippets-select-next-placeholders
        exec '<a-;>d'
    } catch %{
        exec -with-hooks '<c-n>'
    }
}
map global insert <c-n> "<a-;>: insert-c-n<ret>"

# ui options -------------------------------------------------------------

colorscheme saturn

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

set-option global ui_line_numbers_flags -hlcursor
set-option global ui_wrap_flags -word -width 100

set-face global Scrollbar "%opt{bg_bright},default"
set-face global ScrollbarSel "%opt{brcyan}"
set-face global ScrollbarHL "%opt{bg_warning}"
set-option global scrollbar_char "▌"
set-option global scrollbar_sel_char "▌"

hook global WinCreate .* %{
    # ui-line-numbers-toggle
    # ui-whitespaces-toggle
    ui-cursorline-toggle
    ui-trailing-spaces-toggle
    ui-search-toggle
    ui-matching-toggle
    scrollbar-enable
}

# windowing
foot-integration-enable
hook -group terminal global ModuleLoaded kitty %{
    alias global terminal kitty-terminal
    alias global popup kitty-terminal
}

# native file picker
define-command find-edit -params 1 -shell-script-candidates 'rg --files' -docstring 'Find and edit' %{
    edit %arg{1}
}
alias global f find-edit
define-command find-edit-all -params 1 -shell-script-candidates 'rg --files --hidden' -docstring 'Find all and edit' %{
    edit %arg{1}
}
alias global fa find-edit-all

# populate list of recently opened files
hook global BufCreate [^*].* %{
    nop %sh{
        mru=~/.cache/kak-mru
        echo "$kak_buffile" | awk '!seen[$0]++' - "$mru" | sponge "$mru"
    }
}

# misc
hook global WinDisplay .* info-buffers
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

# modeline  -------------------------------------------------------------

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
