export GOPATH="$HOME/.go"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"

export XBPS_DISTDIR="$HOME/.void-packages"

export BROWSER="firefox"
export TERMINAL="foot"
export EDITOR="kcr edit"
export VISUAL="kcr edit"

export DMENU_PROGRAM="fzf-menu"
export FLOATING_TERMINAL="footclient --app-id popup"

export NNN_PLUG='l:launch;f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_TRASH=1
export NNN_COLORS='1234'

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="\
	--layout=reverse\
	--inline-info\
	--height=40\
	--preview-window=down:40%:border-top\
	--color=pointer:8,info:8,hl:3,hl+:3,bg+:#404040\
	"

if [ "$(uname -s)" == "Linux" ]; then
	eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
	export SSH_AUTH_SOCK
	export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
	export SSH_ASKPASS=/usr/libexec/seahorse/ssh-askpass
	export GPG_TTY=$(tty)

	if [[ -z $WAYLAND_DISPLAY && $(tty) == "/dev/tty1" ]]; then
		exec start-sway.sh
	fi
fi

# vi:ft=sh
