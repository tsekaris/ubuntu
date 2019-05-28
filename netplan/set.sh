#!/bin/sh

file=~/.0/netplan/0.yaml
vim $file
#cat $file > /etc/netplan/0.yaml #Δεν λειτουργεί με sudo
sudo cp $file  /etc/netplan/0.yaml
sudo netplan apply
read -p "Press enter to continue." dummy
