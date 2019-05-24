#!/bin/sh

ubuntu(){
    sudo apt-get install mpv -y
}

ppa(){
    sudo apt-get install software-properties-common -y #Χρήση ppa στο λειτουργικό
    sudo add-apt-repository ppa:mc3man/mpv-tests -y
    sudo apt-get install mpv
}

ppa
