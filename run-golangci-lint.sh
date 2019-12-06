#!/bin/sh
ERRS=$(golangci-lint run)
if [ -n "${ERRS}" ]; then
    exit 1
fi
exit 0
