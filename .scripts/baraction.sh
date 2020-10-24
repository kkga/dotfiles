#!/bin/bash
# baraction.sh for spectrwm status bar

SLEEP_SEC=5
while :; do

	eval $(sensors 2>/dev/null | sed s/[°+C]//g | awk '/edge/ {printf "GPUTEMP=%s;", $2}; /^Tdie/ {printf "CPUTEMP=%s;", $2}; /^fan1/ {printf "FANSPD=%s;",$2};' -)
	TEMP_STR="Tcpu $CPUTEMP / Tgpu $GPUTEMP / Fgpu $FANSPD"

	WLAN_ESSID=$(iwconfig wlo1 | awk -F "\"" '/wlo1/ { print $2 }')
	eval $(cat /proc/net/wireless | sed s/[.]//g | awk '/wlo1/ {printf "WLAN_QULTY=%s; WLAN_SIGNL=%s; WLAN_NOISE=%s", $3,$4,$5};' -)
	BCSCRIPT="scale=0;a=100*$WLAN_QULTY/70;print a"
	WLAN_QPCT=`echo $BCSCRIPT | bc -l`
	WLAN_POWER=`iwconfig 2>/dev/null| grep "Tx-Power"| awk {'print $4'}|sed s/Tx-Power=//`
	WLAN_STR="$WLAN_ESSID ($WLAN_QPCT%)"

	CPUFREQ_STR=`echo "Freq:"$(cat /proc/cpuinfo | grep 'cpu MHz' | sed 's/.*: //g; s/\..*//g;')`
	CPULOAD_STR="Load:$(uptime | sed 's/.*://; s/,//g')"

        DATE_STR=`date +"%a %d %b %H:%M"`

	echo -e "$TEMP_STR  -  $WLAN_STR  -  $DATE_STR"

	sleep $SLEEP_SEC
done
