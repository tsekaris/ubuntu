#!/bin/sh

prefix=${HOME}
#Το -L απαραίτητο για συντομεύσεις
mosquitto_server=$(find -L ~/0 -name ".mosquitto" | awk '{ gsub("'${prefix}'","",$1); print $1 }'| fzf)

if [ -f ${prefix}${mosquitto_server} ]
then
sudo pkill mosquitto # Αν εκείνη την στιγμή τρέχει χωρίς systemd
sudo systemctl stop mosquitto.service
sleep 2 #Δεν μπορεί να λειτουργήσει το start κατευθείαν
http_dir=$(dirname -- ${prefix}${mosquitto_server})
cat > ${HOME}/.0/mosquitto/.tmp/mosquitto.conf <<EOF
listener 1883
listener 8000
protocol websockets
http_dir $http_dir
EOF
sudo mv ${HOME}/.0/mosquitto/.tmp/mosquitto.conf /etc/mosquitto/conf.d/mosquitto.conf
sudo systemctl start mosquitto.service
fi
