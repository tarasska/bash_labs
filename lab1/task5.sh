#!/bin/bash
echo "please select and enter a number"
echo "1 - nano"
echo "2 - vi"
echo "3 - links"
echo "4 - exit"
read X
case $X in
  1)
  /bin/nano
  ;;
  2)
  /usr/bin/vi
  ;;
  3)
  /snap/bin/links
  ;;
  4)
  exit 0
  ;;
  *)
  echo "incorrect input :("
esac
