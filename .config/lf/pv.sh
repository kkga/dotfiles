#!/bin/sh

case "$1" in
	*.md) lowdown -Tterm "$1" ;;
	*.tar*) tar tf "$1" ;;
	*.zip) unzip -l "$1" ;;
	*.rar) unrar l "$1" ;;
	*.7z) 7z l "$1" ;;
	*.pdf) pdftotext "$1" - ;;
	# *) highlight -O ansi "$1" ;;
	*) bat -P --color always -r 0:"$2" "$1" ;;
esac
