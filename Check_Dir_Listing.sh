#!/bin/bash

# Check list of URLs for directory listing.  Can be used with https://github.com/mr-tomr/bash-helpers/blob/main/Check_Urls.sh
# Created to automate retests.

# Usage function
usage() {
    echo "Usage: $0 <url_file>"
    echo "Example: $0 urls.txt"
    exit 1
}

# Check if a file is provided
if [ -z "$1" ]; then
    echo "Error: No file provided."
    usage
fi

URL_FILE="$1"

# Check if the file exists
if [ ! -f "$URL_FILE" ]; then
    echo "Error: File '$URL_FILE' not found!"
    exit 1
fi

OUTPUT_FILE="dir_listings.txt"

# Clear previous output file
> "$OUTPUT_FILE"

# Print table header for display
echo -e "Checking for Directory Listings from file: $URL_FILE\n"
printf "%-40s %-10s\n" "URL" "DIRECTORY LISTING"
printf "%-40s %-10s\n" "----------------------------------------" "----------------"

# Loop through each URL
while IFS= read -r url; do
    # Skip empty lines
    [[ -z "$url" ]] && continue
    
    # Fetch the full page content (increased to first 100 lines)
    content=$(curl -s --max-time 10 "$url" | head -n 100)

    # Check for directory listing indicators
    if echo "$content" | grep -iqE "(Index of /|Parent Directory|Directory Listing|Name Last modified|Size Name|<pre>.*<A HREF=|<title>.* - /</title>|&lt;dir&gt;|<hr>.*<pre>)"; then
        result="YES"
        echo "$url" >> "$OUTPUT_FILE"
    else
        result="NO"
    fi

    # Print result in table format
    printf "%-40s %-10s\n" "$url" "$result"

done < "$URL_FILE"

echo -e "\n[+] Directory listing URLs saved to $OUTPUT_FILE"
