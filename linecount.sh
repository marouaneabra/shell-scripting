#!/bin/sh

# Author: Marouane Abra
# Date: 2/25/18
# This program by default will report the total number of lines in all of the files
# in the current working directory or a specific type of files (extra credit)

# recursively finds all files using the find command
# -name to support file glob pattern
# -type specifies to files and gets rid of warning messages (X is a directory)
# wc -l counts the lines and xargs gives an accurate count
# tail command ouputs the last line which is the total count
if [ $# -eq 1 ];then
    find . -name "$1" -type f | xargs wc -l | tail -n 1
else
    find . -name '*' -type f | xargs wc -l | tail -n 1
fi
