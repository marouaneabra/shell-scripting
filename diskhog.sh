#!/bin/sh

# Author: Marouane Abra
# Date: 2/25/18
# This program lists the 5 largest items in current directory in decreasing order.
# It also takes a flag (-c) to change the number of items to display and another to limits it to
# files (-f) or directories (-d). (Extra Credit)

NUM_FILES=5 # default number of files to display
INPUT=* # default input which includes both files and directories in the current directory

# delete outputfile if it exists already or if user wants to run the program
# with the flag f more than once
if [ -f outputfile ];then
    rm -f outputfile
fi

# flag -c, followed by a number, changes the number of files/directories to display
# flag -d displays directories only
# flag -f displays files only
# flag -c and -d changes the number of directories to display
# flag -c and -f changes the number of files to display
if [ $# -gt 0 ];then
    if [ "$1" = "-c" ];then
	NUM_FILES="$2"
    elif [ "$2" = "-c" ];then
	NUM_FILES="$3"
    fi
    if [ "$1" = "-d" ] || [ "$3" = "-d" ];then
	INPUT="./*/" # displays directories only
    elif [ "$1" = "-f" ] || [ "$3" = "-f" ];then 
	for i in $(ls -p | grep -v / | sort -h -r | head -n $NUM_FILES) # du command on files only 
	do
	    du -h $i >> outputfile # redirect to an outside file then sort it at the end
	done
    fi
fi

# du command that finds the size of each file/directory using the flag h for human readable sizes
# sort command that sorts the sizes and reverse them using the flag r, -h sort human readable sizes
# head command that prints the first input number largest files using -n
if [ "$1" != "-f" ] && [ "$3" != "-f" ];then
    du -h $INPUT | sort -h -r | head -n $NUM_FILES
else
    sort -h -r outputfile | head -n $NUM_FILES
fi
