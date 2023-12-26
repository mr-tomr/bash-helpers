#!/bin/bash

# Creyated by Tom R. 20231225
# Takes list of directories and displays Owner and Permissions
# List might be created from sudoer secure paths, etc.

# Oneliner
# while IFS=: read -r directory; do if [ -d "$directory" ]; then echo "Directory: $directory"; stat -c "Permissions: %A %a\nOwner: %U" "$directory"; else echo "Directory does not exist: $directory"; fi; done < dirs.txt


# Check if the dirs.txt file exists
if [ ! -f "dirs.txt" ]; then
    echo "Error: The 'dirs.txt' file does not exist."
    exit 1
fi

# Read each directory from dirs.txt and display permissions and owner
while IFS= read -r directory; do
    # Check if the directory exists
    if [ -d "$directory" ]; then
        # Use 'stat' to get permissions, owner, and display them
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
done < "dirs.txt"
