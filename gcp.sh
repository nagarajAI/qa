#!/bin/bash

git add .
git commit -m "$1"
git push

if [[ $? -eq 0 ]]; then
	echo "Chnages are pushed to remote"
	exit
fi

echo "Something wrong chnages not pushed.."
