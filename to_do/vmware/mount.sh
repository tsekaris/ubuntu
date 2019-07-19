#!/bin/sh

sudo vmhgfs-fuse .host:/ ~/host -o allow_other -o uid=1000
