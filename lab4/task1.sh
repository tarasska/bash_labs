#!/bin/bash

time=$(date "+%d-%m-%Y_%H-%M-%S")
cur_dir="$HOME/OS/lab4"

mkdir $cur_dir/test \
  && echo "catalog test was created successfully" > $cur_dir/report.txt \
  && touch $cur_dir/"$time".txt

# -c 1 один запрос
ping -c 1 "www.net_nikogo.ru"  2>> $cur_dir/report.txt
