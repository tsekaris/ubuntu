#!/bin/sh

sudo apt-get install software-properties-common -y #Χρήση ppa στο λειτουργικό
sudo add-apt-repository ppa:wireguard/wireguard
#sudo apt-get update #Δεν χρειάζεται στο ubuntu 18.04
sudo apt-get install wireguard -y
modprobe wireguard #or reboot. Ενεργοποίηση στον linux πυρήνα
# lsmod | grep wireguard # Για να δούμε αν έχει ενεργοποιηθεί
