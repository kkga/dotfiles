#!/bin/sh
# Simple script that uses maim to take a screenshot

selection=$(
    echo -e "Clipboard\nFile\nImgur" | dmenu -p "Screenshot" -l 10
)

case "$selection" in
    Clipboard) shotgun -s | xclip -selection clipboard -t image/png;;
    File) shotgun ~/Pictures/Screenshots/$(date +%s).png;;
    Imgur) shotgun ~/tmp/screenshot.png; imgur.sh /tmp/screenshot.png | xclip -selection clipboard;;
esac
