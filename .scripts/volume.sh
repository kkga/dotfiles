#!/bin/bash
# Change volume using amixer and output current state to dunstify

# Arbitrary but unique message id
msgId="991049"

amixer set Master -M $@ > /dev/null

STATUS=$(amixer sget Master -M | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
VOLUME=$(amixer get Master -M | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

if [ "$STATUS" = "off" ]; then
	dunstify "Volume" "Mute" -r "$msgId"
else
	dunstify "Volume" "$VOLUME" -r "$msgId"
fi

gsound-play -i audio-volume-change -d "changeVolume"
