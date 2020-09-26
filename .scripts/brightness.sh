#!/bin/sh
#----------
# Adjust external display brightness via ddcutil
# Pass 2 arguments for 1st and 2nd display
# Needs i2c_dev kernel module loaded
# https://wiki.archlinux.org/index.php/Backlight#External_monitors

sudo -A ddcutil -d 1 setvcp 10 $1
sudo -A ddcutil -d 2 setvcp 10 $2
