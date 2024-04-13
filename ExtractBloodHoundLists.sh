# Created by Tom R.

# export files of computers and users from BloodHound, in to json files.

# Run computers through this and it will extract computer names 

grep -o '\<[A-Z][A-Za-z]*\.[A-Z][A-Za-z]*\>' computers.json | sort | uniq

# Run users.json through this one

grep -oE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' users.json | sort | uniq
