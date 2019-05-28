#!/bin/sh

read -p "Name:" name
mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -b 2048 -f $name
read -p "Keys are in '~/.ssh'. Press enter."  dummy
