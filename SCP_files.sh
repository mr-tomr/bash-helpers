# Created by Tom R.

# Quick reminder on copying files to or from a Linux server, using scp.

# Copy linpease file to local
scp -i id_ecdsa -P 2222 user@server.com:peasesult.txt .

# Upload Chisel to server

scp -i id_ecdsa -P 2222 /tools/chisel user@server.com:~  
