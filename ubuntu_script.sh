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
sudo snap install code --classic
sudo apt install vim -y
#user=$( who | tail -1 | tr -s ' ' | tr ' ' '\n' | head -1)
#su $user
curl https://raw.githubusercontent.com/linuxacademy/content-intro-to-python-development/master/helpers/bashrc -o ~/.bashrc




# git config
if [ $# -eq 2 ];then
git config --global user.name "$1"              # to change your username
git config --global user.email "$2"   # to change your email
fi

# development language
apt install openjdk-11-jre -y
apt install maven -y

# docker
curl https://get.docker.com/ > docker.sh && chmod u+x docker.sh
./docker.sh
chmod 777 /var/run/docker.sock
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.14.1-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64
dockerfile=$( echo $( ls  | grep "docker-desktop"))
dockername=$( echo $dockerfile | tr '?' '\n' | head -1)
mv $dockerfile $dockername
apt-get install ./$dockername -y

# utilities
snap install discord
apt install awscli -y
snap install slack
snap install jenkins --classic
