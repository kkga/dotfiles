alias gg="lazygit"
alias ls="exa --group --git --group-directories-first"
alias y="yadm"
alias cat="bat"
alias xr='doas xbps-remove'
alias att='alacritty-theme-toggle'

alias cp="cp -i"
alias mv='mv -i'

alias k='kcr edit'
alias K='kcr-fzf-shell'
alias KK='K --working-directory .'
alias ks='kcr shell --session'
alias a='kcr attach'
alias :='kcr send'
alias :cat='kcr cat --raw'
alias val='kcr get --value'
alias opt='kcr get --option'
alias reg='kcr get --register'

alias t='todo.sh'

alias zk='ZK_NOTEBOOK_DIR=~/notes/h ~/.local/bin/zk'
alias zkw='ZK_NOTEBOOK_DIR=~/notes/w ~/.local/bin/zk'

set --global hydro_symbol_prompt           '>'
set --global hydro_symbol_git_dirty        '*'

set -x LS_COLORS "$LS_COLORS:ow=1;7;34:st=30;44:su=30;41"

set fish_greeting					       ''
set fish_color_autosuggestion              normal
set fish_color_cancel                      -r
set fish_color_command                     --bold
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
