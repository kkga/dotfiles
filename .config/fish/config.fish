set -x LS_COLORS 'di=0;35:ln=1;34:ex=1;30'

alias vim=nvim
alias gg=lazygit
alias ls=exa
alias y=yadm

alias xr='doas xbps-remove'

set --global hydro_symbol_prompt '>'
set --global hydro_symbol_git_dirty '*'

set fish_greeting
set fish_color_command normal --bold
set fish_color_param normal
set fish_color_quote green
set fish_color_cwd purple
set fish_color_error red --bold
set fish_color_status red
set fish_color_comment brblack
set fish_color_operator normal
set fish_color_redirection normal --bold
set fish_color_end normal
set fish_color_search_match --background=white
set fish_color_match brblack
set fish_color_autosuggestion $fish_color_comment

set fish_pager_color_prefix normal --bold
set fish_pager_color_progress normal --bold
set fish_pager_color_completion brblack
set fish_pager_color_background --background=background
set fish_pager_color_description $fish_color_comment
set fish_pager_color_selected_completion white
set fish_pager_color_selected_description white

zoxide init fish | source

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
