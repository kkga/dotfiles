#!/bin/bash

UPDATES=$(doas xbps-install -nu | wc -l)

if [ $UPDATES != "0" ]; then
	echo "$UPDATES"
fi
