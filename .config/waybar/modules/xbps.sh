#!/bin/sh

refresh() {
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
	refresh
	check
	sleep 10s
done
