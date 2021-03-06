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

curl $url >>/tmp/gitversion.git 1>/dev/null 2</dev/null
echo 'list of stable releases from git were taken'

cat /tmp/gitversion.txt | grep "tar.gz" | sed '/manpages/d' | sed '/htmldocs/d' | sed '/core/d' | awk -F '"' '{print $2}' | cut -c 5- | awk -F '.tar.gz' '{print $1}'


