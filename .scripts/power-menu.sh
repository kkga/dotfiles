#!/bin/sh
#----------
# Launch a dmenu based power menu.

selection=$(
  echo "lock\nrestart-dwm\nkill-x\nshutdown\nreboot\nsuspend" |
  bemenu -p "" -l 10
)

case "$selection" in
       lock) loginctl lock-session;;
 restart-wm) pkill dwm;;
     kill-x) pkill xinit;;
   shutdown) loginctl poweroff;;
     reboot) loginctl reboot;;
    suspend) loginctl suspend & loginctl lock-session;;
esac
