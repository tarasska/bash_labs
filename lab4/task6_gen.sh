#!/bin/bash
./task6_proc.sh&
while true; do
  read line
  if [ "term" == "$line" ]; then
    kill -SIGTERM $(cat .pid)
    exit
  fi
done
