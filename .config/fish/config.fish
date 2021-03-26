set -x LS_COLORS 'di=0;35:ln=1;34:ex=1;30'

alias vim=nvim
alias gg=lazygit
alias ls=exa
alias y=yadm

alias xr='doas xbps-remove'

set --global hydro_symbol_prompt '>'
set --global hydro_symbol_git_dirty '*'

set fish_color_autosuggestion      normal
set fish_color_cancel              -r
set fish_color_command             brgreen
set fish_color_comment             brmagenta
set fish_color_cwd                 green
set fish_color_cwd_root            red
set fish_color_end                 brmagenta
set fish_color_error               brred
set fish_color_escape              brcyan
set fish_color_history_current     --bold
set fish_color_host                normal
set fish_color_match               --background=brblue
set fish_color_normal              normal
set fish_color_operator            cyan
set fish_color_param               brblue
set fish_color_quote               yellow
set fish_color_redirection         bryellow
set fish_color_search_match        'bryellow' '--background=brblack'
set fish_color_selection           'white' '--bold' '--background=brblack'
set fish_color_status              red
set fish_color_user                brgreen
set fish_color_valid_path          --underline
set fish_pager_color_completion    grey
set fish_pager_color_description   yellow
set fish_pager_color_background    --background=background
set fish_pager_color_prefix        'white' '--bold' '--underline'
set fish_pager_color_progress      'brwhite' '--background=cyan'
set fish_pager_color_selected_completion 'brgreen' '--background=green'
set fish_pager_color_selected_description white

# set fish_greeting
# set fish_color_command normal --bold
# set fish_color_param normal
# set fish_color_quote green
# set fish_color_cwd purple
# set fish_color_error red --bold
# set fish_color_status red
# set fish_color_comment brblack
# set fish_color_operator normal
# set fish_color_redirection normal --bold
# set fish_color_end normal
# set fish_color_search_match --background=white
# set fish_color_match brblack
# set fish_color_autosuggestion $fish_color_comment

# set fish_pager_color_prefix normal --bold
# set fish_pager_color_progress normal --bold
# set fish_pager_color_completion brblack
# set fish_pager_color_background --background=background
# set fish_pager_color_description $fish_color_comment
# set fish_pager_color_selected_completion white
# set fish_pager_color_selected_description white

zoxide init fish | source
