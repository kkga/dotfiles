# set -x LS_COLORS 'di=0;35:ln=1;34:ex=1;30'

alias vim=nvim
alias gg=lazygit
alias ls=exa
alias y=yadm
alias xr='doas xbps-remove'

set --global hydro_symbol_prompt '>'
set --global hydro_symbol_git_dirty '*'

set fish_greeting					       ''
set fish_color_autosuggestion              normal
set fish_color_cancel                      -r
set fish_color_command                     brgreen
set fish_color_comment                     brmagenta
set fish_color_cwd                         green
set fish_color_cwd_root                    red
set fish_color_end                         brmagenta
set fish_color_error                       brred
set fish_color_escape                      brcyan
set fish_color_history_current             --bold
set fish_color_host                        normal
set fish_color_match                       --background=brblue
set fish_color_normal                      normal
set fish_color_operator                    cyan
set fish_color_param                       brblue
set fish_color_quote                       yellow
set fish_color_redirection                 bryellow
set fish_color_search_match                'bryellow' '--background=brblack'
set fish_color_selection                   'white' '--bold' '--background=brblack'
set fish_color_status                      red
set fish_color_user                        brgreen
set fish_color_valid_path                  --underline
set fish_pager_color_prefix                normal
set fish_pager_color_completion            normal
set fish_pager_color_description           yellow
set fish_pager_color_selected_background   -r

zoxide init fish | source
