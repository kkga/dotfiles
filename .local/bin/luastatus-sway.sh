#!/bin/sh

cd ~/.config/luastatus && exec luastatus-i3-wrapper\
	sway-backlight.lua\
	sway-mail.lua\
	sway-xbps.lua\
	sway-cpu-usage.lua\
	sway-alsa.lua\
	sway-wireless.lua\
	sway-network-rate.lua\
	sway-battery.lua\
	sway-time-date.lua\
