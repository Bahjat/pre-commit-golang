#!/bin/sh

# Check if the file path argument is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide the path to the coverage threshold file."
    exit 1
fi

# Assign the file path to a variable
coverage_file="$1"

# Check if the input file exists
if [ ! -f "$coverage_file" ]; then
    echo "Error: Coverage threshold file not found at $coverage_file."
    exit 1
fi

# Read the coverage threshold from the file
coverage_line=$(grep -E "^COVERAGE=[0-9]+(\.[0-9]+)?$" "$coverage_file")

# Check if the coverage line is found and extract the coverage value
if [ -z "$coverage_line" ]; then
    echo "Error: Invalid format in $coverage_file. Expected format: COVERAGE=90"
    exit 1
fi

coverage_threshold=$(echo "$coverage_line" | cut -d '=' -f 2)

# Check if the coverage threshold is a valid number
if ! [[ "$coverage_threshold" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid coverage threshold in $coverage_file."
    exit 1
fi

# Run the Golang tests and get coverage
coverage=$((go test -coverprofile=coverage.out ./... && go tool cover -func=coverage.out) | grep "total:" | awk '{print $3}' | sed 's/%//')

# Print the coverage
echo "Code Coverage: ${coverage}%"

# Compare coverage with the threshold
if (( $(echo "$coverage >= $coverage_threshold" | bc -l) )); then
    echo "Coverage is greater than or equal to the threshold. Continuing..."
else
    echo "Coverage is below the threshold. Exiting..."
    rm coverage.out
    exit 1
fi

# Clean up generated coverage file
rm coverage.out