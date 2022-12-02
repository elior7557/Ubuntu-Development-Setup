#!/bin/bash

#check if root
if [ "$EUID" -ne 0 ]; then
  echo "please run as root"
  exit 1
fi

# basic updates
apt update -y && sudo apt upgrade -y
if ! [ $? -eq 0 ]; then
  echo 'something went wrong during apt-update'
  echo 'exiting the script'
  exit 1
fi

apt install snapd -y
apt install curl -y


# code editors
# code editors
snap install code --classic
apt install vim -y

