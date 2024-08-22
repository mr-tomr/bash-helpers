#!/bin/bash

# One liner to set up ssh key authenticaiton, with no password 
# Used mainly in CTF environments.
# Always use password for ssh keys, in production

# No Password

mkdir -p ~/.ssh && chmod 700 ~/.ssh && ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N "" && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && chmod 600 ~/.ssh/id_rsa


# With Password

mkdir -p ~/.ssh && chmod 700 ~/.ssh && ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
