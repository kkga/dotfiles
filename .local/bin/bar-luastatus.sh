#!/bin/sh

cd /home/kkga/.config/luastatus

luastatus-stdout-wrapper -B separator='+@fg=2; ╱ +@fg=0;' xbps.lua backlight.lua cpu-usage.lua\
	cpu-temp.lua gpu-temp.lua network-rate.lua xkb.lua time-date.lua
