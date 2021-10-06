#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]] 
then 
  echo 'Please run with sudo or as root.'
  exit 1
fi

if [[ "${#}" -lt 1 ]]
then 
  echo "Usage: ${0} USER_NAME [COMMENT]..."
  echo 'Create an account on the local system with the name of USER_NAME and a comments field of COMMENT.'
  exit 1
fi
  
USER_NAME="${1}"

# All the other parameters are comments for the count this removes username
shift

# Comment is set as all other arguments in command line
COMMENT="${@}"

# Create a password with the 10 first bytes of date with sha256sum
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c10)

useradd -c "${COMMENT}" -m ${USER_NAME}

# Check if user was created successfully
if [[ "${?}" -ne 0 ]]
then 
  echo 'The account could not be created.'
  exit 1
fi

#Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if password command succeeded 
if [[ "${?}" -ne 0 ]]
then 
  echo 'The password could not be set.'
  exit 1
fi

# Force password change on first login. 
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo
echo "Your username is ${USER_NAME}"
echo
echo "Your password is ${PASSWORD}"
echo
echo "Your host is ${HOSTNAME}"
echo
exit 0