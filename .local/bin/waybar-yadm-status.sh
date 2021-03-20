#!/bin/sh

CHANGES=$(yadm status | wc -l)

if [ $CHANGES != "0" ]; then
	echo "$CHANGES"
fi
