#!/bin/sh

check() {
	COUNT=$(yadm status | wc -l)
	if [ "$COUNT" != "0" ]; then
		echo "$COUNT"
	else
		echo ""
	fi
}

while true; do
	check
	sleep 10m
done
