#!/bin/bash

# Created by Tom R. 20240429
# One liner command to take list of IPs and attempt to locate owners.

while IFS= read -r ip; do grep "$ip" all.txt; done < ips.txt

Pull fqdns

while IFS= read -r ip; do grep "$ip" all.txt | awk '{print $2}' | sort -u ; done < ips.txt | tee fqdnlist.txt

Add domain to result

sed 's/^\([^[:space:]]*\)/\1.CONTOSO.com/' preDOMAIN.txt > finalFull.txt

while IFS= read -r ip; do if ping -c 1 "$ip" &> /dev/null; then echo "Ping to $ip successful"; else echo "Ping to $ip failed"; fi; done < NAMES.txt
