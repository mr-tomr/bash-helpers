# Created by Tom R. 20231221

# Creates screen sessions like screener.sh, but joins vpn screen and launches vpn connection at one time.

# This is specific to Offensive Security Labs, where I need to start with multiple screen sessions and  VPN.

# Create a Bash script to run open vpn, using the Universal vpn file.  Name it vpn.sh

#!/bin/bash

# Create a screen session named "rdp"
screen -dmS rdp

# Create a screen session named "web"
screen -dmS web

# Create a screen session named "smb"
screen -dmS smb

# List Screen sessions created
screen -ls

# Start vpn Screen 
#screen -r vpn

# Launch VPN in vpn screen

screen -m -t vpn sh ~/vpn.sh
