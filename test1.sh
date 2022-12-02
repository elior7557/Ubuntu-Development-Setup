#!/bin/bash

# basic updates
sudo apt update -y && sudo apt upgrade -y
if [ #? != 0]; then
  echo 'something went wrong during apt-update'
  echo 'exiting the script'
  exit 1
fi

sudo apt install snapd -y
sudo apt install curl -y


# code editors
