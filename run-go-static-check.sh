#!/bin/sh

set -euo pipefail

cmd_options=()
file_args=()

# we parse out cli options and file arguments
# technically we allow for options to be passed after the file arguments, but
# we know that pre-commit puts the file arguments last
# also, we do not handle file names starting with a hyphen
while [[ $# -gt 0 ]]; do
    if [[ "$1" == -* ]]; then
        # If it's an option, ensure there's a value after it
        if [[ $# -ge 2 && -n "$2" && "$2" != -* ]]; then
            cmd_options+=("$1" "$2")
            shift 2
        else
            echo "Error: Missing value for key $1"
            exit 1
        fi
    else
        file_args+=("$1")
        shift
    fi
done

if [[ ${#file_args[@]} -eq 0 ]]; then
    echo "Error: No file arguments provided"
    exit 1
fi

packages=()

for DIR in $(echo "${file_args[@]}" | xargs -n1 dirname | sort -u); do
    packages+=("$DIR")
done

[[ ${#cmd_options[@]} -eq 0 ]] && cmd_options+=("")

for package in "${packages[@]}"; do
    staticcheck ${cmd_options[@]} ./"${package}"
done
