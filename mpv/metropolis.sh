#!/bin/sh

station=metropolis
url=http://s6.voscast.com:10478

pkill mpv
mpv $url
#tmux a -t radio-$station || tmux new-session -s radio-$station -n mpv "pkill mpv; mpv $url" 
