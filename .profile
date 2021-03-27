export PATH=/var/lib/flatpak/exports/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH

export XBPS_DISTDIR=$HOME/.void-packages

export BROWSER=firefox
export EDITOR=kak-desktop
export VISUAL=kak-desktop
export DMENU='wofi --dmenu'

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--border=bottom --layout=reverse --inline-info --height 40"

if [ $(uname) == "Linux" ]
then
	eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
	export SSH_AUTH_SOCK
	export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
	export SSH_ASKPASS=/usr/libexec/seahorse/ssh-askpass
	export GPG_TTY=$(tty)
fi

