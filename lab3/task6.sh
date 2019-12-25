#!/bin/bash

>new_proc_stat.txt
cur_ppid="0"
child_count=0
child_sum=0;
while read line; do
  new_ppid=$(echo $line \
    | awk '{split($0, a, " "); split(a[3], b, "="); print b[2]}')
  sleepAVG=$(echo $line \
    | awk '{split($0, a, " ");  split(a[5], b, "="); print b[2]}')
  if [ "$cur_ppid" = "$new_ppid" ]; then
    child_count=$((child_count+1))
    child_sum=$(echo "scale=6; $child_sum+$sleepAVG" | bc)
    echo $line >> new_proc_stat.txt
  else
    M=$(echo "scale=10; $child_sum/$child_count" | bc)
    echo "Average_Sleeping_Children_of_ParentID=$cur_ppid is $M" \
      >> new_proc_stat.txt
    child_sum=$sleepAVG
    child_count=1
    cur_ppid=$new_ppid
  fi
done < proc_stat.txt
