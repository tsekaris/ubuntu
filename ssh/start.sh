#!/bin/sh

# Δεν λειτουργεί το search με sh αλλά μόνο με bash. Δεν θα τρέξει με το ranger.
sshd
ip=$(ip a | grep inet | grep -v -e inet6 | grep -v -e "127.0.0.1" | awk '{print $2}')
echo "Type:"
echo "ssh -p 8022 ${ip/\/*/}"
read -p "Press enter." dummy
