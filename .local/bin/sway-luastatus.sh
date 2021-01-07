#!/bin/sh

cd ~/.config/luastatus/sway && exec luastatus-i3-wrapper\
	backlight.lua\
	xbps.lua\
	cpu-usage.lua\
	wireless.lua\
	network-rate.lua\
	alsa.lua\
	battery.lua\
	time-date.lua\
