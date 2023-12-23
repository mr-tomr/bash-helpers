#!/bin/bash

# screener.sh
# Used to create a preset list of Screen sessions.
# Useful for lab environments where you open the same tools every time.
# Created by Tom R.
# Uploaded 20231127

# Screen option flags in use- 
# -d: This option tells screen to start a new session in detached mode, meaning it doesn't attach to the newly created session immediately.
# -m: This option instructs screen to create a new session even if one with the same name already exists.It prevents any error due to a name conflict.
# -S session_name: This flag specifies the name of the screen session to create. 

# Create a screen session named "vpn"
screen -dmS vpn

# Create a screen session named "rdp"
screen -dmS rdp

# Create a screen session named "web"
screen -dmS web

# Create a screen session named "smb"
screen -dmS smb

# Optional - List all created/running Screen sessions
screen -ls


# Update, this can also be a shell alias
# alias screener='screen -dmS vpn && screen -dmS rdp && screen -dmS web && screen -dmS smb && screen -ls && screen -r vpn'
