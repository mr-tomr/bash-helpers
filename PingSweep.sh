#!/bin/sh
# Uses a file named hosts.txt for the list of nodes to check
#Performs a basic, but quick, ping sweep.

awk '{print $1}' < hosts.txt | while read ip; do
    if ping -c1 $ip >/dev/null 2>&1; then
        echo $ip IS UP
    else
        echo $ip IS DOWN
    fi
done
