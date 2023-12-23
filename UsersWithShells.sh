#!/bin/bash

# Created by Tom R.  20231223
# Shell script reads /etc/passwd and returns users with interactive shells

# One liner version 
# awk -F: '$NF ~ "/bash|/zsh|/sh" {print $1}' /etc/passwd


# Check if /etc/passwd exists
if [ -e /etc/passwd ]; then
  # Use awk to search for lines with an interactive shell
  awk -F':' '{if ($NF ~ "/bash" || $NF ~ "/zsh" || $NF ~ "/sh") print $1}' /etc/passwd
else
  echo "/etc/passwd file not found."
fi

