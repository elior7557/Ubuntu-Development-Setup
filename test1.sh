#!/bin/bash
# Usage: ubuntu-setup
# This script will install basic software on your ubuntu using apt and snap


#check if root
if [ "$EUID" -ne 0 ]; then
  echo "please run as root"
  exit 1
fi

# basic updates
apt update -y 1>/dev/null 2>&1 && sudo apt upgrade -y 1>/dev/null 2>&1
if ! [ $? -eq 0 ]; then
  echo 'something went wrong during apt-update'
  echo 'exiting the script'
  exit 1
fi

apt install snapd -y 1>/dev/null 2>&1 && echo 'snap was installed' || echo 'error installid snap'
apt install curl -y 1>/dev/null 2>&1 && echo 'discord was installed' || echo 'erorr installing curl'


# code editors
# code editors
snap install code --classic 1>/dev/null 2>&1 && echo 'visual code was installed' || echo 'error installing visual code'
apt install vim -y 1>/dev/null 2>&1 && echo 'vim was installed' || echo 'eroor installing vim'

