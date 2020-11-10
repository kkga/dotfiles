#!/bin/sh
xrdb -merge $HOME/.Xresources

# for auto-unlocking ssh on login: https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
/usr/libexec/polkit-gnome-authentication-agent-1 &

# statusbar script for dwm
baraction.sh &

# background color
xsetroot -solid "#1c1c1c"

# start syncthing
syncthing -no-browser > /dev/null &

# keyboard daemon
sxhkd &

# clipboard daemon
clipmenud &

# screensaver and screenlock
xset s 300
xss-lock -n /usr/libexec/xsecurelock/dimmer -l -- xsecurelock &

# screen dimmer
gammastep -t 6500:4000 -m randr &

# start dbus session for dwm
exec dbus-run-session dwm-run.sh
