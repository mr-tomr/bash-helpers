#!/bin/bash

# Uploaded by Tom R. 20240113
# Copy text from Offsec website when you start a lab and get the machine names and IPS
# It will look something like this
#    192.168.206.70
#    Active Directory Enumeration - Enumeration Using Legacy Windows Tools - Group 1 - dc1 OS Credentials:
#    No credentials were provided for this machine
# Save to text file and run this against it, to create a host file list.

# Initialize variables
ip=""
text=""

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
      echo "$combined"
      ip="" # Reset IP after processing
      text="" # Reset text after processing
    fi
  fi
done < hosts.txt  # Replace 'hosts.txt' with your input file name
