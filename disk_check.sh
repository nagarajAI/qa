#!/bin/bash

LIMIT=27

DISK_USE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [[ "$DISK_USE" -gt "$LIMIT" ]]; then
  echo "Disk usage-${DISK_USE}% reached limit ${LIMIT}%"
  exit
fi

echo "Disk usage is under the limit"
