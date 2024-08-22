#!/bin/bash

# Updated by Tom R. 20240822
# Copy text from Offsec website when you start a lab and get the machine names and IPS
# It will look something like this
#    192.168.206.70
#    Active Directory Enumeration - Enumeration Using Legacy Windows Tools - Group 1 - dc1 OS Credentials:
#    No credentials were provided for this machine
# Save to text file and run this against it, to create a host file list.

# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: No input file provided."
  echo "Usage: $0 <input_file>"
  exit 1
fi

# Check if the provided file exists and is readable
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
  echo "Error: File '$1' does not exist or is not readable."
  exit 1
fi

# Initialize variables
ip=""
text=""
output=""

# Read the input file line by line
while IFS= read -r line; do
  # Check if the line is an IP address
  if [[ $line =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    # Store the IP address
    ip="$line"
  elif [[ ! -z "$ip" ]]; then
    # Extract the text (first word after the second "-")
    text=$(echo "$line" | awk -F ' - ' '{print $2}' | awk '{print $1}')
    
    # Combine IP address and text
    combined="$ip $text"
    
    # Output the combined result if text is not empty
    if [ ! -z "$text" ]; then
      echo "$combined"    # Print the IP and associated text
      output+="$ip\n"     # Store just the IP in output variable
      ip=""               # Reset IP after processing
      text=""             # Reset text after processing
    fi
  fi
done < "$1"  # Read from the provided input file

# Print a blank line and then list all IPs
echo -e "\n\n$output"
