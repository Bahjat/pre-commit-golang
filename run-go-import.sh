#!/bin/sh

PASS=true

for FILE in "$@"
do
    LIST_OF_FILES=$(goimports -l -w $FILE)
    if [[ -n "$LIST_OF_FILES" ]];then
        PASS=false
    fi
done

if [[ ${PASS} == "false" ]]; then
    exit 1
fi
