#!/bin/sh

station=libero
url=http://eco.onestreaming.com:8081/listen.pls

pkill mpv
mpv $url
#tmux a -t radio-$station || tmux new-session -s radio-$station -n mpv "pkill mpv; mpv $url" 
