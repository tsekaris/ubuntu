#!/bin/sh

station=trito
url=http://radiostreaming.ert.gr/ert-trito

pkill mpv
mpv $url
#tmux a -t radio-$station || tmux new-session -s radio-$station -n mpv "pkill mpv; mpv $url" 
