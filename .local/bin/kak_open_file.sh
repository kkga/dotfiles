#!/bin/sh
session_id=$1
client_id=$2
if git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
	target=$(git ls-files | fzy -l 32)
else
	target=$(rg --files | fzy -l 32)
fi
echo "eval -client ${client_id} edit -existing ${target}" | kak -p "${session_id}"
