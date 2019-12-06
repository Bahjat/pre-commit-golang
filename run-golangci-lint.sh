#!/bin/sh

ERRS=$(golangci-lint run --new-from-rev="$(git rev-parse HEAD)")

if [ -n "${ERRS}" ]; then
    echo "${ERRS}"
    exit 1
fi
exit 0
