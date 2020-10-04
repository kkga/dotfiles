#!/bin/sh

# start gnome-keyring
# for auto-unlocking ssh on login: https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

/usr/libexec/polkit-gnome-authentication-agent-1 &
$HOME/.config/screenlayout/displays.sh &
xrdb -merge $HOME/.Xresources &
$HOME/.config/dwm-bar/dwm_bar.sh &
sxhkd &
dunst &
clipmenud &
redshift -l 55:37 &
xset s 600 &
xset r rate 200 30 &
xsetroot -solid "#1c1c1c" &
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &
exec dbus-launch --exit-with-session dwm
