#!/bin/bash

ps -A -o pid,command | grep -E '([0-9]+) /sbin/' | awk '{split($0, a, " "); print a[1]}'
