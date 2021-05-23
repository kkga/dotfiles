#!/bin/sh

COUNT=$(yadm status | wc -l)

if [ "$COUNT" != "0" ]; then
	echo "$COUNT"
fi
