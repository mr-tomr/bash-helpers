# Created by Tom R.
# Created 20240425

# Demonstrates how a list of passwords can be used to create precomputed NTLM and MD5 hash tables 

NTLM
while IFS= read -r password; do echo -n "$password" | iconv -t utf16le | openssl md4 | cut -d ' ' -f 2 | tr -d '\n'; echo -n ":$password"; echo ""; done < passwords | sort | tee ntlmhashes.txt

MD5 Sum
while IFS= read -r password; do echo -n "$password" | md5sum | cut -d ' ' -f 1 | tr -d '\n'; echo -n ":$password"; echo ""; done < passwords | sort | tee md5hashes.txt
