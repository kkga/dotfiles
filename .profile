if [ -f /usr/share/defaults/etc/profile ]; then
    source /usr/share/defaults/etc/profile
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/3.7/bin

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim

export FZF_DEFAULT_COMMAND="rg --files --follow"
export FZF_DEFAULT_OPTS="--color=bw"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export RESTIC_REPOSITORY="sftp:gadzhi.synology.me:/home/restic-backup"
export RESTIC_PASSWORD_COMMAND="security find-generic-password -s backup-restic-repository -a restic_backup -w"
