#!/bin/sh

# Δημιουργούμε ένα κρυφό tag αρχείο με το οποίο το σύστημα θα μπορεί να το βρει και να τρέξει ένα mosquitto server (μαζί με web) στο φάκελο που είναι το αρχείο αυτό.
cat > .mosquitto <<EOF
A mosuitto server.
EOF
