#!/bin/sh
#----------
# Launch a dmenu based power menu.

selection=$(
  echo "lock\nkill-x\nshutdown\nreboot\nsuspend" | $DMENU
)

case "$selection" in
       lock) loginctl lock-session;;
     kill-x) pkill xinit;;
   shutdown) loginctl poweroff;;
     reboot) loginctl reboot;;
    suspend) loginctl suspend & loginctl lock-session;;
esac
