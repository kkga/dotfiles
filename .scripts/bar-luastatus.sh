#!/bin/sh

cd /home/kkga/.config/luastatus

luastatus-stdout-wrapper -B separator='  ' xbps.lua cpu-usage.lua\
	cpu-temp.lua gpu-temp.lua network-rate.lua alsa.lua xkb.lua time-date.lua
