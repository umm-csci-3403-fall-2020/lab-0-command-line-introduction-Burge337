#!/bin/bash

##Copying the lab requirements above the lines of code that perform the given task may remove later.

##Takes one argument, which is the number that will be used as an argument when you call the C program that you'll be compiling in a bit.

#The number taken in and used for our C program
arg_number=$1

##Extracts the contents of the tar archive NthPrime.tgz into the NthPrime directory
tar -zxf NthPrime.tgz --one-top-level

#Go into the NthPrime directory
cd NthPrime

#Compile the source files into an exe (NthPrime)
gcc main.c nth_prime.c -o NthPrime

#Call the exe
./NthPrime $arg_number
