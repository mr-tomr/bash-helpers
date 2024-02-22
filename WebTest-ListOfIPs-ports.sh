# Created by Tom R - 20240221

# Attempts to connect to each url:port, twice.  Waits only 5 seconds for a reply, each time.

for url in http://1.1.1.1:7800 http://2.2.2.2:8643 http://3.3.3.3:8096 http://4.4.4.4:4569 http://7.6.3.3:62048; do wget --timeout=5 --tries=2 "$url"; done
