#!/bin/sh

if ! command -v go-dochl 2>&1 /dev/null
then
    echo "Error: go-dochl not found. Please install it by running 'go get -u github.com/diontr00/dochl@latest' and ensure it is in your PATH."
    exit 1
fi

KEY="$1"

# Run dochl with provided arguments or default
dochl_output=$(go-dochl -keys="$KEY" "$@")

# Check if dochl found any matching comments
if [ -n "$dochl_output" ]; then
    echo "You have work todo. Commit rejected."
    go-dochl -keys="$KEY" "$@"
    exit 1
else
    exit 0
fi
