#!/bin/bash

# Created by Tom R.
# Script takes single IP addresses, subnets or list of IPs or hostnames within a file and pings them, returning the TTL.
# Use this to verify likely OS of large lists of hosts.

#!/bin/bash

# Usage function to display how to use the script
usage() {
  echo "Usage: $0 <IP_or_Subnet> | -f <file_name>"
  echo "  <IP_or_Subnet> - The IP address or subnet (e.g., 192.168.1.0/24) to ping"
  echo "  -f <file_name>  - A file containing a list of IP addresses or hostnames to ping"
  exit 1
}

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Error: No IP, subnet, or file name provided!"
  usage
fi

# Function to ping a single IP and display TTL
ping_ip() {
  local ip=$1
  ttl=$(ping -c 1 "$ip" | grep -oP 'ttl=\K\d+')

  # If TTL is found, print the IP and TTL value
  if [ -n "$ttl" ]; then
    echo "IP: $ip, TTL: $ttl"
  else
    echo "IP: $ip, No response"
  fi
}

# Function to handle subnet expansion and ping each IP
ping_subnet() {
  local subnet=$1

  # Generate IPs in the subnet using nmap or ipcalc (depending on availability)
  if command -v nmap &> /dev/null; then
    # Using nmap to scan the range of the subnet
    nmap -n -sn "$subnet" | grep 'Nmap scan report for' | awk '{print $5}' | while IFS= read -r ip; do
      ping_ip "$ip"
    done
  elif command -v ipcalc &> /dev/null; then
    # Using ipcalc to calculate the range of IPs in the subnet
    ipcalc -n -r "$subnet" | grep 'Host' | awk '{print $2}' | while IFS= read -r ip; do
      ping_ip "$ip"
    done
  else
    echo "Error: Neither nmap nor ipcalc is available for subnet expansion."
    exit 1
  fi
}

# Function to handle file input
ping_file() {
  local file=$1

  # Read each line from the file (IPs or hostnames)
  while IFS= read -r ip_or_host; do
    # Ping each IP or hostname
    ping_ip "$ip_or_host"
  done < "$file"
}

# Check if the argument is an IP address, subnet, or file
if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  # If it's a single IP, ping it directly
  ping_ip "$1"
elif [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+$ ]]; then
  # If it's a subnet, expand it and ping each IP in the range
  ping_subnet "$1"
elif [[ "$1" == "-f" && -n "$2" ]]; then
  # If the flag "-f" is used, treat the second argument as a file
  if [ ! -f "$2" ]; then
    echo "Error: File '$2' not found!"
    exit 1
  fi
  ping_file "$2"
else
  # If the input doesn't match IP, subnet, or file format
  echo "Error: Invalid input format!"
  usage
fi
