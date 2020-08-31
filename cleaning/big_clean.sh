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

#Same thing but without the .tgz so we specify what to replace the whole path with
base_tar_no_suffix=`basename -s .tgz $arg_tar`

#Swap to the Scratch directory to make the new tar file
#cd $SCRATCH || exit

#Create file name for newly cleaned tar file (includes .tgz on end)
clean_name="cleaned_"
clean_name+=$base_tar

#Change into the starting directory before we create our tar archive
cd $cleaning || exit

#Create a compressed archive of all the files that weren't deleted. Should be named based on the original tar file name
#but prefix with cleaned_

#This part was truly miserable to get working. Major credit to https://stackoverflow.com/a/27274924 for their
#explanation.

#I believe the -C $SCRATCH bit works by directing changing the directory that will be tarred before the process begins
#whereupon it notices the $base_tar_no_suffix (this would be little_tar or big_tar) and changes the full path with just
#that name instead.
tar -czf $clean_name -C $SCRATCH $base_tar_no_suffix
