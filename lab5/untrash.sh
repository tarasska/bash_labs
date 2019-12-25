#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "please, enter exactly 1 parameter"
	exit 1;
fi

for line in $(grep $1 $HOME/trash.log); do
	abs_path=$(echo $line | awk -F ":" '{print $1}')
	trash_name=$(echo $line | awk -F ":" '{print $2}')

	echo "Do you want to restore this file $abs_path [Y/n]"
	read answer
	if [[ $answer != "Y" ]]; then
		continue
	fi

	trash_file_path=$HOME/.trash/$trash_name

	if [ -d $(dirname $abs_path) ]; then
		if [ -f $abs_path ]; then
			echo "File with the same name already exists"
			exit 1
		else
			ln $trash_file_path $abs_path
			echo "File restored successfully"
		fi
	else
		echo "$(dirname $abs_path) has been deleted!"
		ln $trash_file_path $HOME/$1
	fi
	rm $trash_file_path
	sed -i "/$trash_name/d" "$HOME/trash.log"
	break
done
