#!/bin/bash

LOG_DIR="/home/ubuntu/logs/"
BACKUPS_DIR="/home/ubuntu/log_backups/"
TIMESTAMP=$(date +"%Y-%m-%d_%H_%M_%S")
BACKUP_FILE_NAME="${TIMESTAMP}_LOG_BACKUP.tar.gz"

DAYS_OLD=5

echo $BACKUP_FILE_NAME

if [[ ! -d "${LOG_DIR}" ]]; then
	echo "${LOG_DIR} not exist"
	exit
fi

cd ${LOG_DIR}

#OLD_FILES=$(find . -maxdepth 1 -type f -name "*.log" -mmin +${DAYS_OLD} -printf "%P\n")
#OLD_FILES=$(find . -maxdepth 1 -type f -name "*.log" -mmin +${DAYS_OLD})

#find "$LOG_DIR" -type f -name "*.log" -mmin +${DAYS_OLD} -print0 | \
#tar --null  -czf "${BACKUPS_DIR}${BACKUP_FILE_NAME}" --files-from -

find . -maxdepth 1 -type f -name "*.log" -mmin +${DAYS_OLD} -exec tar -czf "${BACKUPS_DIR}${BACKUP_FILE_NAME}" {} +;
