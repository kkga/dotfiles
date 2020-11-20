#!/bin/sh

# merge user resources for correct DPI setting in Xorg
xrdb -merge $HOME/.Xresources

# for auto-unlocking ssh on login: https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export SUDO_ASKPASS=/usr/libexec/seahorse/ssh-askpass
/usr/libexec/polkit-gnome-authentication-agent-1 &

# background color
xsetroot -solid "#000000"

# simple settings daemon for gtk apps
xsettingsd &

# clipboard daemon
clipmenud &

# keyboard daemon
sxhkd &

# screensaver and screenlock
xset s 300
xss-lock -n /usr/libexec/xsecurelock/dimmer -l -- xsecurelock &

# screen dimmer
gammastep -t 6500:4000 -m randr &

# using spectrwm these days, it's pretty good
exec dbus-run-session spectrwm
