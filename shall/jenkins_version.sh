#!/bin/bash

#this script is to download the required version of jenkins and try to install the version

which java 1>/dev/null
if [ $? -eq 0 ]
then
  echo "java installed and continue to for forther steps"
else
  yum install java-11-openjdk-devel -y 1>/dev/null 2>/dev/null
  echo "java isntallation is done"
fi

echo "CONNECTING TO JENKINS SERVER & LISTING ALL JENKINS VERSIONS"
curl https://get.jenkins.io/war-stable/ >>/tmp/jenkins.txt 1>/dev/null

echo "*******************************LISTING OF ALL AVAILABLE VERSIONS******************************"
cat /tmp/jenkins.txt |sed -n '/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/p' | awk -F '"' '{print $2}' | tr " " "\n" | sort 
echo "***********************PLEASE ENTER REQUIRED VERSION TO INSTALL ******************************"
read -p "please enter version without "/" : " V
echo "******************************DOWNLOADING $V VERISON******************************************"
rm -f jenkins.war
echo  "**************************REMOVING ANY OLD JENKINS FILES ************************************"
  which wget 1>/dev/null
  if [ $? -ne 0 ]
  then
    echo "wget is not intalled, trying to install wget"
    yum install wget -y 1>/dev/null 2>/dev/null
    wget https://get.jenkins.io/war-stable/$V/jenkins.war 1>/dev/null 2>/dev/null
  else
    wget https://get.jenkins.io/war-stable/$V/jenkins.war 
  fi

echo "*****************************FILE IS DOWNLOADED *********************************************"
echo "********************************   INSTALLING JENKINS  ***************************************"

java -jar jenkins.war
