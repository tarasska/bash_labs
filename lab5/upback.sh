#!/bin/bash

restore_dir="$HOME/restore/"

if [ ! -d "$restore_dir" ]; then
	mkdir $restore_dir
fi
last_backup_dir=$(find "$HOME/Backup-"* -maxdepth 0 | sort -r | head -1)"/"
for file in $(ls $last_backup_dir -1); do
	if [ ${#file} -gt 11 ]; then
    res=$(echo $(echo $file | rev | cut -c 1-10 | rev) \
      | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")
    if [ "$res" != "" ]; then
      cp $last_backup_dir$file $restore_dir
    fi
  else
    cp $last_backup_dir$file $restore_dir
  fi
done
