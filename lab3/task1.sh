#!/bin/bash

# ps: -U user process, -o format
ps -U $USER -o pid,command | sed -r 's/([0-9]+) /\1 : /'
