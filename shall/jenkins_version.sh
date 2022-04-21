#!/bin/bash

#this script is to download the required version of jenkins and try to install the version

which java
if [ $? -eq 0 ]
then
  echo "java installed and continue to for forther steps"
else
  yum install java-11-openjdk-devel -y 1>/dev/null 2>/dev/null
  echo "java isntallation is done"
fi

echo "CONNECTING TO JENKINS SERVER AND LISTING ALL JENKINS VERSIONS"
curl https://get.jenkins.io/war-stable/ >>/tmp/jenkins.txt

cat /tmp/jenkins.txt 