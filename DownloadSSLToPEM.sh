#!/bin/bash

# Uploaded by Tom R. 20231116
# Command to create PEM file from SSL certificate.
# This allows you to tell Python to trust them, rather than fixing your Python Code to not Verify :)


openssl s_client -connect target:443 </dev/null | openssl x509 -outform PEM > website.pem
