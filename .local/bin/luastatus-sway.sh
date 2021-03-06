#!/bin/sh

cd ~/.config/luastatus && exec luastatus-i3-wrapper\
	sway-backlight.lua\
	sway-cpu-usage.lua\
	sway-alsa.lua\
	sway-network.lua\
	sway-network-rate.lua\
	sway-kb.lua\
	sway-battery.lua\
	sway-time-date.lua\
