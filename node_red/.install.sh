#!/bin/sh
# Απαραίτητο να έχει εγκατασταθεί το node
# Παλιά γινόταν εγκατάσταση με το node στο ίδιο script και γινόταν σφάλμα με τον φάκελο ~/.config όπoυ γινόταν του root.
npm install -g npm #update npm
npm install -g --unsafe-perm node-red # Χωρίς nvm απαιτείται sudo
