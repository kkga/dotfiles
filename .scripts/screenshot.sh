#!/bin/sh
# Simple script that uses shotgun and hacksaw to take a screenshot and upload to imgur

screenshot=$(
    echo -e "Clipboard\nFile\nImgur" | dmenu -p "Screenshot" -l 10
)

selection=$(hacksaw -f "-i %i -g %g")

case "$screenshot" in
    Clipboard) shotgun $selection - | xclip -selection clipboard -t image/png;;
    File) shotgun $selection ~/Pictures/Screenshots/$(date +%s).png;;
    Imgur) shotgun $selection ~/tmp/screenshot.png; imgur.sh ~/tmp/screenshot.png | xclip -selection clipboard;;
esac
