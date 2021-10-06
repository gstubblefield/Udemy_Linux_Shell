#!/bin/bash

 # This script generates a list of randome passwords.
 
 # A random number as a password 
 PASSWORD="${RANDOM}"
 echo "${PASSWORD}"
 
 # Three random numbers together
 PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
 echo "${PASSWORD}"
 
 # Date from 1970/1/1 in seconds as a password
 PASSWORD=$(date +%s)
 echo "${PASSWORD}"
 
 # Date from 1970/1/1 in seconds plus nano seconds as a password
 PASSWORD=$(date +%s%N)
 echo "${PASSWORD}"
 
# Create a password with the 10 first bytes of date with sha256sum
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# An even better password
# Create a password with the 10 first bytes of date with sha256sum
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Append a special character to the password 
SPECIAL_CHAR=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHAR}"