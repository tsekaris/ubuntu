#!/bin/sh

sudo apt-get install software-properties-common -y #Χρήση ppa στο λειτουργικό
mkdir -p ~/.0/mosquitto/.tmp
sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa -y
sudo apt-get update -y
sudo apt-get install mosquitto -y
sudo apt-get install mosquitto-clients -y
