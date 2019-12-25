#!/bin/bash
touch "emails.lst"
chmod 666 emails.lst
mail="([[:alnum:]_\-\.\+]+)@([[:alnum:]_\-\.]+)\.([[:alpha:]]+)"
# + 1 or more
grep -E -h -s -o $mail /etc/* | tr -s '\n' ','  > emails.lst
truncate -s-1 emails.lst
