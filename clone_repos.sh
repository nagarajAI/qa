#!/bin/bash

list="repos_list.txt"

while read -r line; do
  git clone "$line"
done < "$list"

echo "All repos cloned."
