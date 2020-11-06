#!/bin/bash
# baraction.sh for status bar

SLEEP_SEC=5
while :; do
	# music
	PLAYER_STATUS=$(playerctl status)
	PLAYER_ARTIST=$(playerctl metadata artist)
	PLAYER_TITLE=$(playerctl metadata title)
	PLAYER_STR=""
	if [ $PLAYER_STATUS = "Playing" ]; then
		PLAYER_STR="$PLAYER_ARTIST - $PLAYER_TITLE"
	fi

	# system
	CPU=$(sensors | grep Tdie | cut -c 16-17)
	GPU=$(sensors | grep edge | cut -c 16-17)
	GPU_MEM=$(sensors | grep mem | cut -c 16-17)
	GPU_FAN=$(sensors | grep fan1 | awk '{print $2}')
	CPU_INFO_STR="CPU $CPU°"
	GPU_INFO_STR="GPU $GPU°/$GPU_MEM°/$GPU_FAN"
	DATE_STR=`date +"%a %d %b %H:%M"`

	xsetroot -name "$PLAYER_STR  |  $CPU_INFO_STR  |  $GPU_INFO_STR  |  $DATE_STR"

	sleep $SLEEP_SEC
done
