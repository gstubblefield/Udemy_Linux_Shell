#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]] 
then 
  echo 'Please run with sudo or root.'
  exit 1
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter the name of the person or application who this account is for: ' COMMENT

# Get the password.
read -p 'Enter the passord to use for the account: ' PASSWORD

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then 
  echo 'user not created successfully.'
  exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then 
  echo 'password not created successfully.'
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
echo "Your host is ${HOSTNAME}
exit 0