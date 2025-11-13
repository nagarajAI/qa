#!/bin/bash

if [[ $# -lt 1 ]]; then
	echo "Commit message required"
	exit
fi

git add .
git commit -m "$1"

echo "Pushing changes to remote repo"
git push

if [[ $? -eq 0 ]]; then
	echo "Chnages are pushed to remote"
	exit
fi

echo "Something wrong chnages not pushed.."
