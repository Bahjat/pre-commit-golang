#!/bin/sh

PASS=true
for FILE in "$@"
do
    golint -set_exit_status "$FILE"
    if [ "$?" -eq 1 ]; then
        PASS=false
    fi
done

if [ "$PASS" = "false" ]; then
    exit 1
fi