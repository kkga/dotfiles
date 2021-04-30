export VOLTA_HOME="$HOME/.volta"
export GOPATH="$HOME/.go"

export PATH=/var/lib/flatpak/exports/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$VOLTA_HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export XBPS_DISTDIR=$HOME/.void-packages

export BROWSER=firefox
export EDITOR="kcr edit"
export VISUAL="kcr edit"
export DMENU='wofi --dmenu'

export MANPAGER=most
export MOST_INITFILE=$HOME/.config/most/mostrc

# export DMENU_PROGRAM='term-dmenu'
export FLOATING_TERMINAL='alacritty --class popup -e'

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=40 --preview-window=down:60%:border-horizontal"

if [ $(uname -s) == "Linux" ]; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
    export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
    export SSH_ASKPASS=/usr/libexec/seahorse/ssh-askpass
    export GPG_TTY=$(tty)

    if [[ -z $WAYLAND_DISPLAY && $(tty) == "/dev/tty1" ]]; then
        exec sway-run.sh
    fi
fi
