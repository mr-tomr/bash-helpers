#!/bin/bash

# Created by Tom R. 20231225
# Display permissions and owners of all folders named (s)bin

# One Liner
# find / \( -type d -name "bin" -o -name "sbin" \) -o \( -type l -name "bin" -o -name "sbin" \) 2>/dev/null | while IFS= read -r directory; do if [ -d "$directory" ]; then permissions=$(stat -c "%A %a" "$directory"); owner=$(stat -c "%U" "$directory"); echo "Directory: $directory"; echo "Permissions: $permissions"; echo "Owner: $owner"; echo; else echo "Directory does not exist: $directory"; echo; fi; done


find / \( -type d -name "bin" -o -name "sbin" \) -o \( -type l -name "bin" -o -name "sbin" \) 2>/dev/null | while IFS= read -r directory; do
    # Check if the directory exists
    if [ -d "$directory" ]; then
        # Use 'stat' to get permissions and owner and display them
        permissions=$(stat -c "%A %a" "$directory")
        owner=$(stat -c "%U" "$directory")
        echo "Directory: $directory"
        echo "Permissions: $permissions"
        echo "Owner: $owner"
        echo
    else
        echo "Directory does not exist: $directory"
        echo
    fi
done
