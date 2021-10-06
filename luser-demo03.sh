#!/bin/bash

# Display the UID and username of the user executing the script.
# Display if the user is the vagrant user or not

# Display the UID
echo "Your UID is ${UID}"

# only display if the UID does not match 1000
TEST_UID='1000'
if [[ "${UID}" -ne "${TEST_UID}" ]]
then 
  echo "Your UID does not match ${TEST_UID}."
  exit 1
fi
  
# Set the username
USER_NAME=$(id -un)

# Test if the command succeeded 
if [[ "${?}" -ne 0 ]]
then 
  echo 'The id command did not execute succesfully.'
  exit 1
fi
echo "Your username is ${USER_NAME}"

# Test a string condiditonal
USER_NAME_TEST='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TEST}" ]]
then 
  echo "Your username matches ${USER_NAME_TEST}."
fi

# Test for not equal to the string
USER_NAME_TEST='vagrant'
if [[ "${USER_NAME}" != "${USER_NAME_TEST}" ]]
then 
  echo "Your username does not match ${USER_NAME_TEST}."
  exit 1
fi

exit 0