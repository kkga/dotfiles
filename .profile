if [ -f /usr/share/defaults/etc/profile ]; then
    source /usr/share/defaults/etc/profile
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH=$PATH:/usr/local/opt/python@3.7/bin
export PATH=$PATH:/var/lib/flatpak/exports/bin/

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty

export FZF_DEFAULT_OPTS="--color bw"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export TTDL_FILENAME=$HOME/notes/todo.txt
export BAT_THEME=ansi-light
# export LS_COLORS="di=0;35:ln=1;34:ex=1;30"

if [[ "$(uname)" == "Linux" ]]; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK

    export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
    # export MOZ_ENABLE_WAYLAND=1
    # export QT_QPA_PLATFORM=wayland-egl
    export QT_WAYLAND_FORCE_DPI=physical
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    # export GDK_SCALE=2
    # export GDK_DPI_SCALE=0.5
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export MANGOHUD=1
    export ENABLE_VKBASALT=1


    # If running from tty1 start sway
    # if [ "$(tty)" = "/dev/tty1" ]; then
    #     exec dbus-run-session sway
    # fi

elif [[ "$(uname)" == "Darwin" ]]; then
    export RESTIC_REPOSITORY="sftp:gadzhi.synology.me:/home/restic-backup"
    export RESTIC_PASSWORD_COMMAND="security find-generic-password -s backup-restic-repository -a restic_backup -w"
fi
