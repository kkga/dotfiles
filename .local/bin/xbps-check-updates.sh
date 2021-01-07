#!/bin/bash

UPDATES=$(doas xbps-install -nSu | wc -l)

if [ $UPDATES != "0" ]; then
	echo "XBPS $UPDATES"
fi
