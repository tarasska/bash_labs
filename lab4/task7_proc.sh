#!/bin/bash
echo $$ > .pid
i=1
mod="?"
sigterm()
{
  mod="stop"
}
usr1()
{
  mod="+"
}
usr2()
{
  mod="*"
}

trap 'sigterm' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while true; do
  case $mod in
    "+")
      let i=$i+2
      echo $i
      ;;
    "*")
      let i=$i*2
      echo $i
      ;;
    "stop")
      echo "stop by SIGTERM"
      exit
  esac
  mod="~"
  sleep 1
done
