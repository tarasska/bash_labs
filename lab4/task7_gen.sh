#!/bin/bash
./task7_proc.sh&
while true; do
  read line
  case $line in
    "term")
      kill -SIGTERM $(cat .pid)
      exit
      ;;
    "+")
      kill -USR1 $(cat .pid)
      ;;
    "*")
      kill -USR2 $(cat .pid)
      ;;
  esac
done
