#!/bin/bash
# baraction.sh for status bar

SLEEP_SEC=5
while :; do
	CPU=$(sensors | grep Tdie | cut -c 16-17)
	GPU=$(sensors | grep edge | cut -c 16-17)
	GPU_MEM=$(sensors | grep mem | cut -c 16-17)
	GPU_FAN=$(sensors | grep fan1 | awk '{print $2}')

	TEMP_STR="CPU $CPU° | GPU $GPU°/$GPU_MEM°/$GPU_FAN"
	DATE_STR=`date +"%a %d %b %H:%M"`

	xsetroot -name "$TEMP_STR | $DATE_STR"

	sleep $SLEEP_SEC
done
