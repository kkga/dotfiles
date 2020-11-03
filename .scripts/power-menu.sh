#!/bin/sh
#----------
# Launch a dmenu based power menu.

selection=$(
  echo "lock\nlogout\nshutdown\nreboot\nsuspend" |
  dmenu -p "" -l 10 -b
)

case "$selection" in
       lock) loginctl lock-session;;
     logout) pkill dwm;;
   shutdown) loginctl poweroff;;
     reboot) loginctl reboot;;
    suspend) loginctl suspend & loginctl lock-session;;
esac
