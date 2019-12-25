#!/bin/bash
echo $$ > .pid
i=0
mod="run"
sigterm()
{
  mod="stop"
}
trap 'sigterm' SIGTERM
while true; do
  if [ "$mod" == "stop" ]; then
    echo "stop by SIGTERM"
    exit
  else
    let i=$i+1
  fi
sleep 1
done
