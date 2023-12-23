#!/bin/bash

# Created by Tom R. 20231222
# This file pulls out the NT hashes froma a file named hashes.txt, so you run them through Crackstation as a batch.

# Check if the "hashes.txt" file exists
if [ ! -f "hashes.txt" ]; then
  echo "Error: File 'hashes.txt' not found."
  exit 1
fi

# Use awk to extract the NT hashes (between the 3rd and 4th colon)
awk -F':' '{print $4}' hashes.txt
