#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "please, enter exactly 1 parameter"
	exit 1;
fi

trash=~/.trash
log=~/trash.log

if ! [ -d $trash ]; then
	mkdir $trash
fi
file=$(date "+%d-%m-%Y_%H-%M-%S")
ln $1 "$trash/$file"
rm $1
if ! [ -f $log ]; then
	touch $log
fi
echo "$PWD/$1:$file" >> $log
