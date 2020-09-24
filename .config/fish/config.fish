alias vim 'nvim'
alias c 'clear'
alias ls 'exa'
alias eo 'sudo eopkg'
alias gg 'lazygit'
alias brewup 'brew update && brew upgrade && brew cask upgrade'
alias kd 'kitty @ set-colors -a "~/.config/kitty/theme-dark.conf"'
alias kl 'kitty @ set-colors -a "~/.config/kitty/theme-light.conf"'

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set fish_greeting
set fish_color_command normal --bold
set fish_color_param normal
set fish_color_quote green
set fish_color_cwd purple
set fish_color_error red --bold
set fish_color_status red
set fish_color_comment 777777
set fish_color_operator normal
set fish_color_redirection normal --bold
set fish_color_end normal
set fish_color_search_match --background=bfbcaf
set fish_color_match normal
set fish_color_autosuggestion $fish_color_comment

set fish_pager_color_prefix normal --bold
set fish_pager_color_progress normal --bold
set fish_pager_color_completion normal
set fish_pager_color_description $fish_color_comment

zoxide init fish | source
starship init fish | source

