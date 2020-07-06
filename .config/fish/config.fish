set fish_greeting ''

set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_paths

alias vim 'nvim'
alias nano 'kibi'

alias p 'sudo pacman'
alias c 'clear'
alias ls 'exa'

alias gg 'lazygit'

alias cfg '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias brewup 'brew update && brew upgrade && brew cask upgrade'

alias gdocs 'open ~/repos/godot-docs/_build/html/index.html'
alias godot '/Applications/Godot.app/Contents/MacOS/Godot'

alias kd 'kitty @ set-colors -a "~/.config/kitty/theme-dark.conf"'
alias kl 'kitty @ set-colors -a "~/.config/kitty/theme-light.conf"'

zoxide init fish | source
starship init fish | source
