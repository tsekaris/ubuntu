#!/bin/sh

for script in $HOME/.0/*/.install.sh
do
    sh "$script"
done
