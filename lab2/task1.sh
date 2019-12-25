#!/bin/bash
touch "errors.log"
chmod 666 errors.log
grep -E -h -r -s "^dpkg.*" /var/log/ > errors.log
# -E Interpret PATTERN as an extended regular  expression
# -h Suppress  the  prefixing  of  file names on output
# ^ beginning of line
# -s no errors
# .* - все что угодно
grep -E -h "^.*\.[[:alpha:]]" /home/$USER/OS/lab2/errors.log
# begin symbol + alnum + dot + aplpha
