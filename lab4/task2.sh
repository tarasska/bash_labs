#!/bin/bash
cur_dir="$HOME/OS/lab4"

at now+2 minutes -f ./task1.sh
tail -n 0 -f $cur_dir/report.txt
