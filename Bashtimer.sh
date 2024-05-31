# Created by Tom R.

# Simple Bash timer to use while waiting on automation to perform.


for i in {60..1}; do printf "\r%2d [%-60s]" $i $(printf '#%.0s' $(seq 1 $((60-i+1)))); sleep 1; done; echo
