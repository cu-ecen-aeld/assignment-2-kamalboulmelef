#!/bin/bash

# Check if both arguments are provided (writefile and writestr)
if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments"
    echo "Usage: $0 <file-path> <text-string>"
    exit 1
fi

# Assign arguments to variables for readability
writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
dir=$(dirname "$writefile")
mkdir -p "$dir"

# Try to create/write the file and check if the operation is successful
if echo "$writestr" > "$writefile"; then
    echo "Successfully written to $writefile"
else
    echo "Error: Could not create or write to the file $writefile"
    exit 1
fi
