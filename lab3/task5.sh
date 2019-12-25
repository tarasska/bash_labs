#!/bin/bash

>buf.txt
for dir in $(ls /proc/ | grep -E '[[:digit:]]'); do
  if [ -f "/proc/$dir/status" ] && [ -f "/proc/$dir/sched" ]; then
    pid=$(cat "/proc/$dir/status" \
      | grep '^Pid:' \
      | awk '{ print $2 }')
    ppid=$(cat "/proc/$dir/status" \
      | grep '^PPid:' \
      | awk '{ print $2 }')
    dividend=$(cat "/proc/$dir/sched" \
      | grep 'sum_exec_runtime' \
      | awk '{ print $3 }')
    divisor=$(cat "/proc/$dir/sched" \
      | grep 'nr_switches' \
      | awk '{ print $3 }')
    if [ $divisor -eq 0 ]; then
      sleepAVG=-1
    else
      sleepAVG=$(echo "scale=10; $dividend/$divisor" | bc)
    fi

    long_String="ProcessID=$pid : Parent_ProcessID = $ppid
      : Average_Sleeping_Time=$sleepAVG"
    echo $long_String >> buf.txt
  fi
done

sort -n -k5 buf.txt | sed "s/ = /=/" > proc_stat.txt
