#!/bin/bash
touch "full.log"
chmod 666 full.log
grep -E -h "(WW)" /var/log/Xorg.0.log | sed -E "s/(WW)/Warning:/"> full.log
# sed -E regular expression
# s/regexp/replacement/
grep -E -h "(II)" /var/log/Xorg.0.log | sed -E "s/(II)/Information:/">> full.log
