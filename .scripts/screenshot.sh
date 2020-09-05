#!/bin/sh
# Simple script that uses shotgun and hacksaw to take a screenshot and upload to 0x0.st

screenshot=$(
    echo -e "Clipboard\nFile\n0x0.st" | dmenu -p "Screenshot" -l 10
)

selection=$(hacksaw -f "-i %i -g %g")

case "$screenshot" in
    Clipboard) shotgun $selection - | xclip -selection clipboard -t image/png;;
    File) shotgun $selection ~/Pictures/Screenshots/$(date +%s).png;;
    0x0.st) shotgun $selection ~/tmp/screenshot.png; cd ~/tmp; curl -F'file=@screenshot.png' https://0x0.st | xclip -selection clipboard;;
esac
