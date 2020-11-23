export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH=$PATH:/usr/local/opt/python@3.7/bin
export PATH=$PATH:/var/lib/flatpak/exports/bin/

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export PAGER=nvimpager

export SKIM_DEFAULT_OPTIONS='--height=40% --reverse --color=bw'
export BAT_THEME='ansi-light'
export BAT_STYLE='changes,header'
export LS_COLORS='di=1;30:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

if [[ "$(uname)" == "Linux" ]]; then
    # eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    # export SSH_AUTH_SOCK
    # export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
    export QT_WAYLAND_FORCE_DPI=physical
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    # export QT_QPA_PLATFORMTHEME=qt5ct
    export QT_STYLE_OVERRIDE=kvantum
    export MANGOHUD=1
    export ENABLE_VKBASALT=1
    export BEMENU_SCALE=2
    export BEMENU_OPTS="-i -l 12 -p '' -P '' -H 20  --hb=#282828 --hf=#ffffff"
    export DMENU=bemenu
    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
fi
