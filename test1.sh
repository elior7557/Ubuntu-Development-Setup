#!/bin/bash
# Usage: ubuntu-setup
# This script will install basic software on your ubuntu using apt and snap


#check if root
if [ "$EUID" -ne 0 ]; then
  echo "please run as root"
  exit 1
fi



# basic updates
echo "Starting The Script By Runnint apt update && Upgrade"
apt update -y 1>/dev/null 2>&1 && sudo apt upgrade -y 1>/dev/null 2>&1
if ! [ $? -eq 0 ]; then
  echo 'something went wrong during apt-update'
  echo 'exiting the script'
  exit 1
fi

echo "Updates run successfuly staring to install some application: "

#Skip some installs for testin purposes
if [ $1 == 'T' ]; then
  echo 'Testin mode is on'
else
  apt install snapd -y 1>/dev/null 2>&1 && echo 'snap was installed' || echo 'error installig snap'
  apt install curl -y 1>/dev/null 2>&1 && echo 'curl was installed' || echo 'error installing curl'

  # code editors
  snap install code --classic 1>/dev/null 2>&1 && echo 'visual code was installed' || echo 'error installing visual code'
  apt install vim -y 1>/dev/null 2>&1 && echo 'vim was installed' || echo 'error installing vim'

  # utilities
  snap install discord 1>/dev/null 2>&1 && echo 'Discord was installed' || echo 'error installing Discord'
  snap install slack 1>/dev/null 2>&1 && echo 'slack was installed' || echo 'error installing slack'
fi
#DevOps Setup

#Docker
echo 'Installing Docker'
curl --silent -o /dev/null https://get.docker.com/ > docker.sh && chmod u+x docker.sh
./docker.sh 1> /dev/null 2>&1 && echo 'docker was installed' || echo 'error installing docker'
chmod 777 /var/run/docker.sock
rm ./docker.sh

#Docker Desktop
echo 'Installing Docker Desktop'
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.14.1-amd64.deb?utm_source=docker -q --show-progress -O docker-desktop.deb && echo 'deb file installed'
sudo apt-get install ./docker-desktop.deb -y 1> /dev/null 2>&1 && echo 'Docker Desktop was installed' || echo 'error installing docker desktop'
rm docker-desktop.deb

#Updating Bashrc File
echo " Update bashrc file"
curl https://raw.githubusercontent.com/linuxacademy/content-intro-to-python-development/master/helpers/bashrc -o ~/.bashrc