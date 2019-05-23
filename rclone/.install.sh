#!/bin/sh

ubuntu(){
  sudo apt-get install rclone -y
}

site(){
  curl https://rclone.org/install.sh | sudo bash
}

site
