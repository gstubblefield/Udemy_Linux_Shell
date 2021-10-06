#!/bin/bash

# This script creates an account on the local system 
# You will be prompted for the account name and password

# Ask for username
read -p 'Enter the username to create: ' USER_NAME

# Ask for real name
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the password 
read -p 'Enter the passord to use for the account: ' PASSWORD

# Create the user 
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the users. 
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force passord change on first login. 
passwd -e ${USER_NAME}

