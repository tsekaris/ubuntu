#!/bin/sh

mosquitto_conf=${HOME}/.0/.tmp/mosquitto/mosquitto.conf
if [ -f $mosquitto_conf ]
then
    mosquitto -c $mosquitto_conf -v
else
    read -p "No last configuration" dummy 
fi

