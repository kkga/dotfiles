#!/bin/sh

sync() {
	doas xbps-install -S > /dev/null
}

check() {
	UPDATES=$(xbps-install -un | cut -d' ' -f2 | sort | uniq -c | xargs)
	if [ -z "$UPDATES" ]; then
		echo ""
	else
		echo "$UPDATES""s"
	fi
}

while true; do
	sync
	check
	sleep 10m
done
