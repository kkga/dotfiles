#!/bin/sh

cd /home/kkga/.config/luastatus

luastatus-stdout-wrapper -B separator=' · ' network-rate.lua cpu-usage.lua cpu-temp.lua gpu-temp.lua alsa.lua xkb.lua time-date.lua
