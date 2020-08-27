#!/bin/bash

#Capturing the tar file we will be cleaning
arg_tar=$1

#Make a temporary for our work
SCRATCH=`mktemp --directory`

#Extract the given tar files into the temporary directory
tar zxf $arg_tar --directory $SCRATCH
