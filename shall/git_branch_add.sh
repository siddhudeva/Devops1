#!/bin/bash
if [$1 -z ];then
echo  enter NEW GIT BRANCH NAME along with script ex: git_branch_add.sh <YourBranch>
exit 1
fi
#this script is to validate and creates a new branch
git branch | grep -w $1
echo $?

if [$? -eq 0];
then 
   echo this branch is already exists
else
   git branch $1
fi