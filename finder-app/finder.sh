#!/bin/bash

# Check if the number of arguments is correct (2 arguments: filesdir and searchstr)
if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments"
    echo "Usage: $0 <directory-path> <search-string>"
    exit 1
fi

# Assign arguments to variables for readability
filesdir=$1
searchstr=$2

# Check if the first argument is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory '$filesdir' does not exist"
    exit 1
fi

# Find the number of files in the directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Find the number of lines containing the search string
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"
