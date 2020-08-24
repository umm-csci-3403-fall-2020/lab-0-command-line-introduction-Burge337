#!/usr/bin/bash

#Capturing arguments that will be used by the script

#The number used for our C program
arg_number=$1
#The name used for the destination directory
arg_dir=$2

#Extracting the tar file contents into our desired directory
tar xf $NthPrime --directory $arg_dir
