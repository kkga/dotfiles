#!/bin/sh
#----------
# Launch a dmenu based power menu.

selection=$(
  echo -e "lock\nlogout\nshutdown\nreboot\nsuspend" |
  wofi -d  "What would you like to do? " -l 10
)

case "$selection" in
       lock) slock;;
     logout) pkill dwm;;
   shutdown) loginctl poweroff;;
     reboot) loginctl reboot;;
    suspend) loginctl suspend & slock;;
esac
