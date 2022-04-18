#!/bin/bash

#this script is to validate and creates a new branch
git branch | grep -w $1
echo $?

if [$? is -eq 0];
then 
   this branch is already exists
else
   git branch $1
fi