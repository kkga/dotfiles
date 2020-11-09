#!/bin/bash
# changeVolume

# Arbitrary but unique message id
ID="991049"

pamixer "$@" > /dev/null

VOLUME="$(pamixer --get-volume-human)"
dunstify -u low -r "$ID" "Volume" "${VOLUME}" 

gsound-play -i audio-volume-change -d "changeVolume"
