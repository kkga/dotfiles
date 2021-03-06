# ~/.profile

PATH="$HOME/.local/bin:$HOME/.deno/bin:$HOME/.volta/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin/:$PATH"
export PATH

export XBPS_DISTDIR="$HOME/.void-packages"
export BROWSER="firefox"
export EDITOR="kcr edit"
export VISUAL="kak"
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS="\
	--layout=reverse\
	--inline-info\
	--height=40\
    --preview-window=down:40%:border-top\
	--color=pointer:8,info:8,hl:3,hl+:3,bg+:#404040\
	"

# if [[ -z $WAYLAND_DISPLAY && $(tty) == "/dev/tty1" ]]; then
# 	exec start-sway
# fi

# if [ "$(uname -s)" == "Linux" ]; then
#     eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
#     export SSH_AUTH_SOCK
#     export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
#     export SSH_ASKPASS=/usr/libexec/seahorse/ssh-askpass
#     export GPG_TTY=$(tty)
# fi
