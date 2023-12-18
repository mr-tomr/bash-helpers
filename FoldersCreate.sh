#!/bin/bash
# Created by Tom R. 20231218
# Script to create "standard" folders for a pentest.

# Ask user for test name
read -p "Enter the test name: " test_name

# Generate folder name using today's date and test name
folder_name=$(date +"%Y%m%d")"-$test_name"

# Create the main folder
mkdir "$folder_name"

# Create subfolders inside the main folder
subfolders=("burp" "emails" "nmap" "reports" "retests")
for subfolder in "${subfolders[@]}"; do
    mkdir "$folder_name/$subfolder"
done

echo "Folder and subfolders created successfully!"
