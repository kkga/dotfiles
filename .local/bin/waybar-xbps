#!/bin/sh

sync() {
	doas xbps-install -S > /dev/null
}

check() {
	UPDATES=$(xbps-install -un | wc -l)
	if [ "$UPDATES" -eq "0" ]; then
		echo ""
	else
		echo "$UPDATES"
	fi
}

while true; do
	sync
	check
	sleep 10m
done
