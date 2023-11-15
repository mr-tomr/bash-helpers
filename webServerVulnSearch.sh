# Script to scan a web server for its name and version and search for known vulnerabilites.
# Created by Tom R. 20231115
# You can enable verification of the response for debugging the script.

# Usage webServerVulnSearch.sh <target name or IP>


#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <target>"
  exit 1
fi

# Get the target from the command line argument
target="$1"

# Run Nmap with the http-server-header script and save the result
nmap_result=$(nmap --script http-server-header "$target")

# Extract the server information using awk
server_info=$(echo "$nmap_result" | awk -F ': ' '/_http-server-header/ {gsub(/\//," ",$NF);gsub(/\(.*\)/,"",$NF); print $NF}')

# Check if the server information is empty
if [ -z "$server_info" ]; then
  echo "Unable to extract server information. Check your target and try again."
  exit 1
fi

# Display the extracted server information
echo "Extracted Server Information: $server_info"

# Uncomment to Ask the user to confirm if the extracted data is correct
#read -p "Is the extracted data correct? (yes/no): " confirmation

# Uncomment to check the user's response
#if [ "$confirmation" != "yes" ]; then
#  echo "Aborting script."
#  exit 1
#fi

# Extract the server name and version
server_name=$(echo "$server_info" | awk '{print $1}')
server_version=$(echo "$server_info" | awk '{print $2}')

# Perform a searchsploit search for the server name and version
searchsploit "$server_name $server_version"
