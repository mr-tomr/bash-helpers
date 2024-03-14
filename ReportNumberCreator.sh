#!/bin/bash

# Created by Tom. R 20240314
# This will create sub numbers for reporting, such as 3.2.2.x, which is needed when creating certain reports but Excel doesn't always work.
# When dealing with hundreds or thousands of lines this is much faster.

echo 3.3.2.{1..786} | tr ' ' '\n' >> filename.txt
