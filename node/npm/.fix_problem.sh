#!/bin/sh

# Από https://github.com/termux/termux-packages/issues/3114
 echo "set maxConcurrentWorkers to the number of cpu cores (or 1)"
 read pause
 vim $PREFIX/lib/node_modules/npm/node_modules/worker-farm/lib/farm.js
