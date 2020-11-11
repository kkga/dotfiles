#!/bin/sh
#----------
# Adjust external display brightness via ddcutil
# Pass 2 arguments for 1st and 2nd display
# Needs i2c_dev kernel module loaded
# https://wiki.archlinux.org/index.php/Backlight#External_monitors

# Alternatively, install the ddcci-driver-linux dkms module and use any backlight utility.

# Use these commands in case of using the i2c_dev module
# doas ddcutil -d 1 setvcp 10 $1
# doas ddcutil -d 2 setvcp 10 $2

ID="43290"

brillo -q -s "$@" > /dev/null

BRIGHTNESS_1="$(brillo -q -s ddcci4)"
BRIGHTNESS_2="$(brillo -q -s ddcci5)"

dunstify -u low -r "$ID" "Brightness" "1: ${BRIGHTNESS_1}\n2: ${BRIGHTNESS_2}"
