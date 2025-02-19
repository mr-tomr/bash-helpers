#!/bin/bash

# More for narrowing the focus of retests, script tests each server:port to verify a response.
 
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
 
OUTPUT_FILE="results.txt"
ONLINE_FILE="online_urls.txt"
 
# Clear previous output files
> "$OUTPUT_FILE"
> "$ONLINE_FILE"
 
# Print header to output file
echo -e "URL\tSTATUS\tRESPONSE_TIME (s)" > "$OUTPUT_FILE"
 
# Print table header for display
echo -e "Checking URLs from file: $URL_FILE\n"
printf "%-40s %-10s %-15s\n" "URL" "STATUS" "RESPONSE TIME (s)"
printf "%-40s %-10s %-15s\n" "----------------------------------------" "--------" "---------------"
 
# Loop through each URL
while IFS= read -r url; do
    # Skip empty lines
    [[ -z "$url" ]] && continue
    
    # Measure response time and get HTTP status code
    result=$(curl -o /dev/null -s -w "%{http_code} %{time_total}" --max-time 10 "$url")
 
    # Extract status code and response time
    status=$(echo "$result" | awk '{print $1}')
    response_time=$(echo "$result" | awk '{print $2}')
 
    # Print results in table format
    printf "%-40s %-10s %-15s\n" "$url" "$status" "$response_time"
 
    # Save results to output file
    echo -e "$url\t$status\t$response_time" >> "$OUTPUT_FILE"
 
    # If status code is between 200 and 399, save it to online_urls.txt
    if [[ "$status" -ge 200 && "$status" -lt 400 ]]; then
        echo "$url" >> "$ONLINE_FILE"
    fi
 
done < "$URL_FILE"
 
echo -e "\n[+] Results saved to $OUTPUT_FILE"
echo -e "[+] Online URLs saved to $ONLINE_FILE"
