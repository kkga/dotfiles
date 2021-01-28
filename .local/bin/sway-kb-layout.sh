#!/bin/bash

swaymsg --type subscribe --monitor '["input"]' | grep --line-buffered "keyboard" | sed -u -r 's/^.*xkb_active_layout_name": "([A-Za-z]*).*$/\1/'
