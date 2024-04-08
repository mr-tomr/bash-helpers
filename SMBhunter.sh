# Created by Tom R.
# Uploaded original 20240408 - The day of the eclipse

# When you have access to an SMB share, use this to get a directory and subdirectory tree listing, including files.

# Great for searching for password files, etc.


smbclient -p 445 \\\\servername.com\\sharename -U username --password=passwordhere -c "cd DIRECTORY; recurse; ls"

#  If you prefer an SMB Burglar, where you download all of the files change the command to....

#   "cd DIRECTORY; recurse; prompt; mget *"
