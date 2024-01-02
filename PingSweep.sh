#!/bin/sh
# Uses a file named hosts.txt for the list of nodes to check.
# Performs a basic, but quick, ping sweep.
# Use additional port scanning to verify if a host is online.

# One Liner with Onscreen Progress
# subnet="172.16.211"; for host in {1..254}; do if ping -c 1 -w 1 "$subnet.$host" >/dev/null 2>&1; then echo -n "$subnet.$host "; else echo -n "."; fi; done; echo


awk '{print $1}' < hosts.txt | while read ip; do
    if ping -c1 $ip >/dev/null 2>&1; then
        echo $ip IS UP
    else
        echo $ip IS DOWN
    fi
done
