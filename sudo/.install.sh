#!/bin/sh

# Ο χρήστης tsekaris να μην βάζει συνέχεια κωδικό.
tempFile=/home/tsekaris/tsekaris
sudo echo "tsekaris ALL=(ALL) NOPASSWD: ALL" > $tempFile
sudo chmod 0440 $tempFile
sudo cp $tempFile /etc/sudoers.d/tsekaris
sudo rm $tempFile
