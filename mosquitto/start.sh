#!/bin/sh

#Εμφάνιση των tags χωρίς το prefix.
prefix=${HOME}
#Το -L απαραίτητο για συντομεύσεις
mosquitto_server=$(find -L ~/0 -name ".mosquitto" | awk '{ gsub("'${prefix}'","",$1); print $1 }'| fzf)

if [ -f ${prefix}${mosquitto_server} ]
then
http_dir=$(dirname -- ${prefix}${mosquitto_server})
cat > ${HOME}/.0/mosquitto/.tmp/mosquitto.conf <<EOF
listener 1883
listener 8000
protocol websockets
http_dir $http_dir
EOF
mosquitto -c ${HOME}/.0/mosquitto/.tmp/mosquitto.conf -v
fi

