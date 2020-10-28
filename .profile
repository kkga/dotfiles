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
export PAGER=nvimpager
export GIT_PAGER=nvimpager

# export FZF_DEFAULT_OPTS="--color bw"
export BAT_THEME=ansi-light

if [[ "$(uname)" == "Linux" ]]; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
    export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
    export QT_WAYLAND_FORCE_DPI=physical
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export MANGOHUD=1
    export ENABLE_VKBASALT=1
    export BEMENU_SCALE=2

    # If running from tty1 start sway
    # if [ "$(tty)" = "/dev/tty1" ]; then
    #     exec dbus-run-session sway
    # fi
fi
