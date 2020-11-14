#!/bin/bash
# baraction.sh for status bar

SLEEP_SEC=5
while :; do
	# music
	PLAYER_STATUS=$(playerctl status)
	PLAYER_ARTIST=$(playerctl metadata artist | cut -c 1-15)
	PLAYER_TITLE=$(playerctl metadata title | cut -c 1-30)
	PLAYER_STR=""
	if [ $PLAYER_STATUS = "Playing" ]; then
		PLAYER_STR="$PLAYER_ARTIST - $PLAYER_TITLE"
	fi

	# keyboard
	KBD=$(xkb-switch)

	# network
	_IP=$(curl -s ifconfig.co/ip)
	_COUNTRY=$(curl ifconfig.co/country-iso)
	NET_STR="$_IP $_COUNTRY"


	# system
	CPU=$(sensors | grep Tdie | cut -c 16-17)
	GPU=$(sensors | grep edge | cut -c 16-17)
	GPU_MEM=$(sensors | grep mem | cut -c 16-17)
	GPU_FAN=$(sensors | grep fan1 | awk '{print $2}')
	CPU_INFO_STR="CPU $CPU°"
	GPU_INFO_STR="GPU $GPU°/$GPU_MEM°/$GPU_FAN"
	DATE_STR=`date +"%a %d %b %H:%M"`

	echo "$PLAYER_STR\
+@fg=2; | +@fg=0;$CPU_INFO_STR\
+@fg=2; | +@fg=0;$GPU_INFO_STR\
+@fg=2; | +@fg=0;$NET_STR\
+@fg=2; | +@fg=0;$KBD\
+@fg=2; | +@fg=0;$DATE_STR"

	sleep $SLEEP_SEC
done
