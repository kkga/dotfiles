#!/bin/sh
xrdb -merge $HOME/.Xresources

# for auto-unlocking ssh on login: https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass

/usr/libexec/polkit-gnome-authentication-agent-1 &
$HOME/.config/screenlayout/displays.sh &
$HOME/.scripts/baraction.sh &

xset s 300 600
xsetroot -solid "#1c1c1c"

syncthing -no-browser > /dev/null &
sxhkd &
clipmenud &
xss-lock -- xsecurelock &
gammastep -t 6500:4000 -m randr &

exec dbus-run-session dwm
