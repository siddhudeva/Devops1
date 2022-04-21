#!/bin/bash
# this is to ping all the nodes which are in a given subnet
echo "*****************Please specify the subnet address upto 3 octacts******************"
read -p "Please enter here (example : 192.168.0) : " SUBNET

for IP in $(seq 1 254)
do 
  ping -c 1 $SUBNET.$IP
done
