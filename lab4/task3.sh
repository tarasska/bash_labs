#!/bin/bash

# минуты - часы - дни .....
# crontab -l посмотреть задания

echo "*/5 * * * 2 task1.sh" | crontab
