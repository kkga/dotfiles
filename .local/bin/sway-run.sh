#!/bin/sh

export TERM=foot
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export XDG_SESSION_TYPE=wayland

exec dbus-run-session sway -d 2> ~/tmp/sway.log
