set fish_greeting ''

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

zoxide init fish | source
starship init fish | source

