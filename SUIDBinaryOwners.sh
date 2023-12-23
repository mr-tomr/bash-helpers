#!/bin/bash

# Created by Tom R. 20231223

#Locates binary files and displays their owners

# One liner 
# find / -perm -u=s -type f -exec stat -c 'Owner of %n is %U' {} + 2>/dev/null


# Find SUID files and display their owner
find / -perm -u=s -type f 2>/dev/null | while read -r suid_file; do
    owner=$(stat -c '%U' "$suid_file" 2>/dev/null)
    if [ -n "$owner" ]; then
        echo "Owner of $suid_file is $owner"
    else
        echo "Unable to determine owner of $suid_file"
    fi
done
