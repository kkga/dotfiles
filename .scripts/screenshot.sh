#!/bin/sh
# Use maim to take a screenshot and upload to 0x0.st

screenshot=$(
    echo "Clipboard\nFile\n0x0.st" | dmenu -p "Screenshot" -l 10
)

# selection=$(slop -f "-i %i -g %g")

case "$screenshot" in
    Clipboard) maim --select - | xclip -selection clipboard -t image/png;;
    File) maim --select ~/Pictures/Screenshots/$(date +%s).png;;
    0x0.st) maim --select ~/tmp/screenshot.png; cd ~/tmp; curl -F'file=@screenshot.png' https://0x0.st | xclip -selection clipboard;;
esac
