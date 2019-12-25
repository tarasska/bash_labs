#!/bin/bash
touch buf5.txt
echo $$ > .pid
./task5_proc.sh&

while true; do
  read line
  case $line in
    "QUIT")
      echo "quit" >> buf5.txt
      kill -9 $!
      echo "successful stop"
      exit
      ;;
    "*")
      echo "multi" >> buf5.txt
      ;;
    *)
      echo $line >> buf5.txt
  esac
done
