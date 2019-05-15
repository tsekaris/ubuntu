#!/bin/sh
rsync -avh --delete --progress ~/0/ tsekaris@10.0.0.100:/home/tsekaris/Dropbox/0 --exclude ".stfolder" --exclude ".stversions"
echo "Press enter"
read dummy
