#!/bin/sh

cd /home/kkga/.config/luastatus

luastatus-stdout-wrapper -B separator='   ' mail.lua xbps.lua backlight.lua cpu-usage.lua \
    cpu-temp.lua gpu-temp.lua network-rate.lua weather.lua xkb.lua time-date.lua
