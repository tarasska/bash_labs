#!/bin/bash

if [[ "$PWD" == "$HOME" ]]
then
  echo "$PWD"
  exit 0
else
  echo "Sorry, you are not in your home directory"
  exit 1
fi
