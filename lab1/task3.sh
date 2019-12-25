#!/bin/bash
read BUF
while [[ $BUF != "q" ]]
do
  ANS="$ANS$BUF"
  read BUF
done
echo $ANS
