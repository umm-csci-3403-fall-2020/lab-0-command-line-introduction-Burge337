#!/bin/bash

##Copying the lab requirements above the lines of code that perform the given task may remove later.

##Takes one argument, which is the number that will be used as an argument when you call the C program that you'll be compiling in a bit.

#The number taken in and used for our C program
arg_number=$1

#Make a sub-directory to store extracted files
mkdir NthPrime

##Extracts the contents of the tar archive NthPrime.tgz into the NthPrime directory
tar -zxf NthPrime.tgz --one-top-level

#Extracting the tar file contents into our desired directory

