#!/bin/bash
awk -F: '{printf "%s:%s\n",$1,$3}' /etc/passwd | sort -t: -n -k2
# -F field separator
# sort -t: -n -k2 сортировать по втором полю после двоеточия
