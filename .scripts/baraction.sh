#!/bin/bash
# baraction.sh for status bar

SLEEP_SEC=5
while :; do

	eval $(sensors 2>/dev/null | sed s/[°+C]//g | awk '/edge/ {printf "GPUTEMP=%s;", $2}; /^Tdie/ {printf "CPUTEMP=%s;", $2}; /^fan1/ {printf "FANSPD=%s;",$2};' -)
	TEMP_STR="Tcpu $CPUTEMP / Tgpu $GPUTEMP / Fgpu $FANSPD"

        DATE_STR=`date +"%a %d %b %H:%M"`

	xsetroot -name "$TEMP_STR  -  $DATE_STR"

	sleep $SLEEP_SEC
done
