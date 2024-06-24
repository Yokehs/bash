#!bin/bash
FILE=./inv

while read line; do
  echo "-----"
  echo "Curling $line"
  curl "$line"
done < $FILE
