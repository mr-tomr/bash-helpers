#!/bin/bash

# Created by Tom R.
# Script takes list of IPs or hostnames and pings them, returning the TTL.
# Use this to verify likely OS of large lists of hosts.

# Usage function to display how to use the script
usage() {
  echo "Usage: $0 <file_name>"
  echo "  <file_name> - The file containing the list of IP addresses to ping"
  exit 1
}

# Check if a file name argument is provided
if [ -z "$1" ]; then
  echo "Error: No file name provided!"
  usage
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found!"
  exit 1
fi

# Read each IP address from the file provided as the argument and ping it
while IFS= read -r ip; do
  # Ping the IP once and capture the TTL value from the response
  ttl=$(ping -c 1 "$ip" | grep -oP 'ttl=\K\d+')

  # If TTL is found, print the IP and TTL value
  if [ -n "$ttl" ]; then
    echo "IP: $ip, TTL: $ttl"
  else
    echo "IP: $ip, No response"
  fi
done < "$1"
