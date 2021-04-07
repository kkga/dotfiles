#!/bin/bash

UPDATES=$(doas xbps-install -Sun | cut -d' ' -f2 | sort | uniq -c | xargs)

if [ -z "$UPDATES" ]; then
    echo ""
else
    echo "$UPDATES""s"
fi
