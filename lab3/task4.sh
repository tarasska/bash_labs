#!/bin/bash

>buf.txt
for dir in $(ls /proc/ | grep -E '[[:digit:]]' | sort -n); do
  if [ -f "/proc/$dir/statm" ]; then
    statm_inf=$(cat "/proc/$dir/statm")
    mem=$(echo $statm_inf | awk '{split($0, a, " "); print (a[1] - a[2])}')
    echo "$dir $mem" >> buf.txt
  fi
done

sort -nk2 buf.txt | tr -s ' ' ':'
