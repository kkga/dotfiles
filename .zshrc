if [[ $- != *i* ]]; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Put your fun stuff here.

# keep this line at the bottom of ~/.bashrc
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
[ -x /usr/local/bin/fish ] && SHELL=/usr/local/bin/fish exec /usr/local/bin/fish
