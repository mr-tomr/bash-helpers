#!/bin/bash

# Takes a csv file with user names and passwords and seperates them in two.
# Use with 'Pitchfork' attack in wfuz, ffuf or Burp Intruder

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_csv_file>"
    exit 1
fi

# Extract columns using awk
awk -F, '{print $1}' "$1" > emails.txt
awk -F, '{print $2}' "$1" > passwords.txt

echo "Extraction complete. Columns saved to emails.txt and passwords.txt"
