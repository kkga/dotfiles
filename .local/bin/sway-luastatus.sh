#!/bin/sh

cd ~/.config/luastatus/sway && exec luastatus-i3-wrapper\
	backlight.lua\
	xbps.lua\
	cpu-usage.lua\
	alsa.lua\
	wireless.lua\
	network-rate.lua\
	battery.lua\
	time-date.lua\
