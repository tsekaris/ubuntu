#!/bin/sh
echo 
echo "rclone syncing to dropbox..."
rclone sync --progress ~/0 dropbox:0 --exclude "/.stfolder/**" --exclude "/.stversions/**" 
echo "rclone finished. Press enter."
echo 
read pause
