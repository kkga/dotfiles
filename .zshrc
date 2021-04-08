if [[ $- != *i* ]]; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Put your fun stuff here.

# keep this line at the bottom of ~/.bashrc
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
