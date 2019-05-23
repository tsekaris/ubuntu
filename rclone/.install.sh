#!/bin/sh

ubuntu(){
  sudo apt-get install rclone -y
}

site(){
  sudo apt-get install curl -y
  curl https://rclone.org/install.sh | sudo bash
}

site
