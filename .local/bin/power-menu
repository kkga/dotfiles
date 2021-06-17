#!/bin/sh
#----------
# Launch a dmenu based power menu.

selection=$(
	printf "Lock\nShutdown\nReboot\nSuspend" | $DMENU_PROGRAM
)

case "$selection" in
	Lock) loginctl lock-session ;;
	Shutdown) loginctl poweroff ;;
	Reboot) loginctl reboot ;;
	Suspend) loginctl suspend & loginctl lock-session ;;
esac
