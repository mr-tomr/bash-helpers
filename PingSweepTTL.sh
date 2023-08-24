#!/bin/sh
# Uses a file named hosts.txt for the list of nodes to check.
# Performs a basic, but quick, ping sweep.
# Use additional port scanning to verify if a host is online.

while read ip; do
    if ttl=$(ping -c1 $ip | grep "ttl=" | awk -F 'ttl=' '{print $2}' | awk '{print $1}'); then
        if [ "$ttl" -gt 0 ]; then
            echo "$ip IS UP (TTL: $ttl)"
        else
            echo "$ip IS UP"
        fi
    else
        echo "$ip IS DOWN"
    fi
done < hosts.txt
