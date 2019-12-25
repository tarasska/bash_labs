#!/bin/bash

source_dir="$HOME/source/"
today=$(date "+%F") #full date; same as %Y-%m-%d
report_file="$HOME/backup-report"
last_backup_dir=$(ls $HOME -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r | head -1)
last_backup_sec=$(date --date=$(echo $last_backup_dir | sed "s/^Backup-//") "+%s")
let date_diff=($(date --date=$today "+%s")-$last_backup_sec)/60/60/24

if [ $date_diff -le 7 ] && [ "$last_backup_dir" != "" ]; then
	cur_backup_dir="$HOME"/"$last_backup_dir/"
  echo "Backup update in directory $cur_backup_dir on $today:" >> $report_file
	for file in $(ls $source_dir -1); do
  	file_path=$cur_backup_dir$file
  	if [ ! -f $file_path ]; then
  		cp $source_dir$file $file_path
  		echo $file >> $report_file
  	fi
	done
  for file in $(ls $source_dir -1); do
  	file_path=$cur_backup_dir$file
  	if [ -f $file_path ]; then
  		old_size=$(stat $source_dir$file -c%s) # in bytes
  		new_size=$(stat $file_path -c%s)
  		if [ $old_size != $new_size ]; then
  			mv $file_path $file_path"."$today
  			cp $source_dir$file $file_path
  			echo "$file "$file"."$today >> $report_file
  		fi
  	fi
	done
else
  cur_backup_dir=$HOME"/Backup-"$today"/"
	mkdir $cur_backup_dir
  echo "Backup created $today in $cur_backup_dir" >> $report_file
  echo "Files copied:" >> $report_file
	for file in $(ls $source_dir -1); do
		cp $source_dir$file $cur_backup_dir
		echo $file >> $report_file
	done
fi
