[ -x $(which fish) ] && SHELL=$(which fish) exec $(which fish)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
