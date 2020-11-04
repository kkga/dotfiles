set -gx SKIM_DEFAULT_OPTIONS '--height=40% --reverse'

alias vim 'nvim'
alias ls 'exa'
alias cat 'bat'
alias gg 'lazygit'
alias hg 'kitty +kitten hyperlinked_grep'
alias d 'kitty +kitten diff'
alias fzf 'sk'

alias xbli 'xpkg -m | fzf --preview "xbps-query -vR {}"'

abbr gs 'git status'
abbr gc 'git checkout'
abbr gps 'git push'
abbr gpl 'git pull'
abbr gl 'git log'
abbr gd 'git diff'
abbr gdt 'git difftool'

abbr xbr 'doas xbps-remove'
abbr xbi 'doas xbps-install'
abbr xbq 'xbps-query'

set lucid_dirty_indicator '*'
set lucid_clean_indicator ' '
set lucid_prompt_symbol '⋗'

set fish_greeting
set fish_color_command normal --bold
set fish_color_param normal
set fish_color_quote green
set fish_color_cwd purple
set fish_color_error red --bold
set fish_color_status red
set fish_color_comment 6c6c6c
set fish_color_operator normal
set fish_color_redirection normal --bold
set fish_color_end normal
set fish_color_search_match white --background=333333
set fish_color_match normal
set fish_color_autosuggestion $fish_color_comment

set fish_pager_color_prefix normal --bold
set fish_pager_color_progress normal --bold
set fish_pager_color_completion normal
set fish_pager_color_description $fish_color_comment

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

zoxide init fish | source
