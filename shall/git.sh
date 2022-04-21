#!/bin/bash
# this script is to list the available git versions releases

url=https://mirrors.edge.kernel.org/pub/software/scm/git/

which curl 
if [ $? -ne 0 ]
then 
  yum install curl -y
fi
if [ -e "/tmp/gitversion.git" ] 
then
  rm -rf /tmp/gitversion.git
  echo "removing old content from "
fi

curl $url >>/tmp/gitversion.git
echo 'list of stable releases from git were taken'
cat /tmp/gitversion.txt |  

