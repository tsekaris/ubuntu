#!/bin/sh

read -p "Name:" name
cd ~/.ssh
ssh-keygen -t rsa -b 2048 -f $name
read -p "Keys are in '~/.ssh'. Press enter."  dummy
