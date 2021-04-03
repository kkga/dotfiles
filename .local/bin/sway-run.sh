#!/bin/sh

. $HOME/.local/bin/env-wayland.sh

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

exec dbus-run-session sway $@
