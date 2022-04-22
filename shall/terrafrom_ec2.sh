#!/bin/bash

# This script is to download and install terraform

which wget 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
  yum install -y wget 1>/dev/null 2>/dev/null
fi
echo "********************** installing YUM_UTILS ***********************"
yum install -y yum-utils 1>/dev/null 2>/dev/null

echo "**********************DOWNLOADING REPOSITORY**************************"
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo 1>/dev/null 2>/dev/null

echo "********************** INSTALING TERRAFORM **************************"
yum install terraform -y &>/tmp/logs

if [ $? -ne 0 ]
then
  echo "*********INSTALLATION PROBLEM WHILE INSTALLING TERRAFORM ************"
  cat /tmp/logs
fi
