#!/bin/bash

doas xbps-install -S > /dev/null

UPDATES=$(xbps-install -un | cut -d' ' -f2 | sort | uniq -c | xargs)

if [ -z "$UPDATES" ]; then
	echo ""
else
	echo "$UPDATES""s"
fi
