#!/bin/sh

LIST_OF_FILES=$(goimports-reviser -rm-unused -format "$@")
# print a list of affected files if any
echo "$LIST_OF_FILES"
if [ -n "$LIST_OF_FILES" ];then
    exit 1
fi