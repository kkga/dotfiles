export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

PATH="$HOME/.scripts:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/Library/Python/3.7/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH
export EDITOR=nvim
# export BROWSER=firefox
export VISUAL=nvim

export TODOTXT_DEFAULT_ACTION=ls
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_DEFAULT_OPTS='--color=bw'

export RESTIC_REPOSITORY='sftp:gadzhi.synology.me:/home/restic-backup'
export RESTIC_PASSWORD_COMMAND='security find-generic-password -s backup-restic-repository -a restic_backup -w'
