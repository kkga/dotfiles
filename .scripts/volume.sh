#!/bin/bash
# changeVolume

# Arbitrary but unique message id
msgId="991049"

pamixer --sink 1 "$@" > /dev/null

volume="$(pamixer --get-volume-human)"
dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
"Volume: ${volume}" 

canberra-gtk-play -i audio-volume-change -d "changeVolume"
