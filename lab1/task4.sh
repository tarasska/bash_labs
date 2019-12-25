#!/bin/bash
read number
cnt=1
while [[ number%2 -ne 0 ]]
do
  let cnt=$cnt+1
  read number
done
echo $cnt
