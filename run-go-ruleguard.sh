#!/bin/sh

RULE_FILE="$1"

if ! command -v ruleguard 2>&1 /dev/null
then
    echo "go-ruleguard could not be found"
    exit
fi

PASS=true

for FILE in "$@"
do
    ruleguard -c 0 -rules "$RULE_FILE" "$FILE"
    if [ "$?" -eq 1 ]; then
        PASS=false
    fi
done

if [ "$PASS" = "false" ]; then
    exit 1
fi
