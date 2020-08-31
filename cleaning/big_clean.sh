#!/bin/bash

#Capturing the tar file we will be cleaning
arg_tar=$1

#Capturing starting directory
cleaning=$(pwd)

#Make a temporary for our work
SCRATCH=`mktemp --directory`

#Extract the given tar files into the temporary directory
tar -zxf $arg_tar --directory $SCRATCH

cd $SCRATCH || exit

#remove all files with the string "DELETE ME!" in them
#solution from https://superuser.com/questions/585391/on-linux-how-can-i-find-all-files-that-contain-a-string-and-delete-them/585436
grep -lrIZ 'DELETE ME!' . | xargs -0 rm -f --

#Grab the basename of the file in preperation of making our new, clean tar file
base_tar=`basename $arg_tar`

#Swap to the Scratch directory to make the new tar file
#cd $SCRATCH || exit

#Create file name for newly cleaned tar file (includes .tgz on end)
clean_name="cleaned_"
clean_name+=$base_tar

cd $cleaning
#This stuff worked when I ran it in the cleaning directory
#tar -czf cleaned_little_dir.tgz -C /home/ben/Lab0/lab-0-command-line-introduction-Burge337/cleaning /tmp/tmp.zh1sbTcLRK/little_dir
#Create a compressed archive of all the files that weren't deleted. Should be named based on the original tar file name
#but prefix with cleaned_
tar -czf $clean_name -C $cleaning $SCRATCH
