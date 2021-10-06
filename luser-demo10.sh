#!/bin/bash

log() {
  # This funciton sends a message to syslog and to standiard output if VERBOSE is true.
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]]
  then 
    echo "${MESSAGE}"
  fi
  logger -t luser-demo10.sh "${MESSAGE}"
}

# function log() {
  # echo "${log}, but in a different way"!
# }

backup_file(){
  # This funciton creates a backup of a file. Resturns a non-zero status on error.
  
  local FILE="${1}" 
  
  # Make sure the file exists. 
  if [[ -f "${FILE}" ]]
  then 
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
	log "Backing up ${FILE} to ${BACKUP_FILE}."
	
	# the exit status of the funciton will be the exit satus of the cp command.
	cp -p ${FILE} ${BACKUP_FILE}
  else
    # The file does not exist, so return a non zero exit status
	return 1
  fi
}
	
readonly VERBOSE='true'
log 'Hello!'
log 'This is fun!'

backup_file '/etc/passwd'

if [[ "${?}" -eq '0' ]]
then 
  log 'File backup succeeded!'
else 
  log 'File back up Failed!'
  exit 1
fi