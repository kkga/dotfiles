#!/bin/sh
export BROWSER="firefox"
export TERMINAL="term"
export TERMCMD="term"
export DMENU_PROGRAM="fzf-menu"
export FLOATING_TERMINAL="footclient --app-id popup"

export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_WEBRENDER=1
export MOZ_DBUS_REMOTE=1
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
