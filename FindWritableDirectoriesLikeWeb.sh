# Created by Tom R.

# Find directories you can load webshells in to, etc.
# In this case, I could start the web service using sudo.  www user was in root group.


find /usr/local/www/apache24 -type d -perm -o=w
