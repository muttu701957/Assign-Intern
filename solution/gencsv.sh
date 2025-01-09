#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <start_index> <end_index>"
  exit 1
fi

start_index=$1
end_index=$2

if [ $start_index -gt $end_index ]; then
  echo "Start index must be less than or equal to end index"
  exit 1
fi

file="inputFile"
> $file

for ((i=$start_index; i<=$end_index; i++)); do
  echo "$i, $((RANDOM % 1000))" >> $file
done

echo "File $file generated successfully."

