#!/bin/sh
# Απαραίτητο να έχει εγκατασταθεί το node
# Παλιά γινόταν εγκατάσταση με το node στο ίδιο script και γινόταν σφάλμα με τον φάκελο ~/.config όπoυ γινόταν του root.
sudo npm install -g npm #update npm
sudo npm install -g --unsafe-perm node-red # Χωρίς nvm απαιτείται sudo
