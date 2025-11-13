#!/bin/bash

if [[ $# -lt 1 ]]; then
	echo "no service entered"
	exit
fi
service="$1"

if ! sudo systemctl is-active --quiet "$service"; then
  echo "$service! is not running.."
  echo "Restarting the $service"
  sudo systemctl restart "$service"
else
  echo "$service is running."
fi

