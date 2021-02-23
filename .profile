export PATH=/var/lib/flatpak/exports/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

export XBPS_DISTDIR=$HOME/.void-packages

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export DMENU=bemenu

export FZF_PREVIEW_PREVIEW_BAT_THEME='ansi-dark'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--height 40% --reverse --color light"
export BEMENU_OPTS="--ignorecase --list 12 -p '' -P ''\
--fb=#000000 --ff=#eeeeee --nb=#111111\
--nf=#888888 --hb=#444444 --hf=#ffffff"

if [ $(uname) == "Linux" ]
then
	eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
	export SSH_AUTH_SOCK
	export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass

	export GPG_TTY=$(tty)
fi

