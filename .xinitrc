#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start gnome-keyring, for auto-unlocking ssh on login: https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
$HOME/.config/screenlayout/displays.sh &
$HOME/.config/dwm-bar/dwm_bar.sh &
$HOME/.fehbg &
# picom &
dunst &
clipmenud &
redshift -l 55:37 &
espanso daemon &
xset r rate 200 30 &
xidlehook --timer 300 'slock' '' --timer 3600 'loginctl suspend' '' &
dbus-launch dwm
