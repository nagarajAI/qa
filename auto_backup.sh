#!/bin/bash

LOG_DIR="/home/ubuntu/logs/"
BACKUPS_DIR="/home/ubuntu/log_backups/"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE_NAME="LOG_BACKUP_${TIMESTAMP}.tar.gz"

DAYS_OLD=5

mkdir -p ${BACKUPS_DIR}

if [[ ! -d "${LOG_DIR}" ]]; then
	echo "${LOG_DIR} does not exist"
	exit 1
fi

cd ${LOG_DIR} 

find . -maxdepth 1 -type f -name "*.log" -mmin +${DAYS_OLD} -print0 | tar --null -czf "${BACKUPS_DIR}${BACKUP_FILE_NAME}" --files-from -

if [[ $? -eq 0 ]]; then
	echo "Log backup archive created at- ${BACKUPS_DIR}${BACKUP_FILE_NAME}"
	find . -maxdepth 1 -type f -name "*.log" -mmin +${DAYS_OLD} -delete
	echo "old log files are removed"
	exit
fi

echo "Logs backup failed!!!"
