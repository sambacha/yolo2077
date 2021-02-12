#!/usr/bin/env bash
# we could set  #!/bin/bash
# pipefail disabled cause reasoons here 
# set -eo pipefail
 
# /**  Fresh System (We Assume) */
echo "==============================="
echo "==> Setting up host system..."
echo "==============================="
cp $HOME/yolo2077/bash_profile $HOME/.bash_profile
# sanity check for shell env
whereis bash
bash --version
source ~/.bash_profile 
echo "==============================="
echo "==> Bash Profile Loaded        "
echo "==============================="

sudo apt-get update  -qq
sudo apt-get upgrade -y -qq
sudo apt update -qq
sudo apt-get upgrade -qq --skip-keypress --checkall
#---------------------------------#
# Install System Build Req.
#---------------------------------#
echo "==============================="
echo " @@@ Setting up host system @@@"
echo "==============================="
sudo apt-get install -y java-common build-essential maven software-properties-common zip -qq
sudo apt-get update  -qq
sudo apt install lzip -y -qq
sudo sysctl -w vm.max_map_count=262144
sudo apt update 
sudo apt-get update
sudo apt-get install -y apt-transport-https zip lzip -qq
sudo apt update 
sudo apt-get update
sudo sysctl -w vm.max_map_count=262144

# install java 11
echo "================================"
echo "==> Installing Java 11...       "
 echo "==============================="
# <!-- INSTALL JAVA -->
sudo apt-get -qq -y --no-install-recommends install gnupg locales
# <!-- INSTALL JAVA: GPG KEYS -->
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
# <!-- INSTALL JAVA: AZUL REPO -->
sudo apt-add-repository "deb http://repos.azulsystems.com/ubuntu stable main"
# <!-- INSTALL JAVA: INSTALL JAVA FINALLY -->
DEBIAN_FRONTEND=noninteractive sudo apt-get -qq -y --no-install-recommends install zulu-11=11.39+15
sudo apt-get update -qq

echo "==============================="
echo "==> Installing Nodejs 12...    "
echo "==============================="
# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

echo "==> Adjust NTP   "
# configure ntp
sudo apt update 
sudo apt-get --assume-yes install ntp || true
 
sudo sed -i '/^server/d' /etc/ntp.conf
sudo tee -a /etc/ntp.conf << EOF
server time1.google.com iburst
server time2.google.com iburst
server time3.google.com iburst
server time4.google.com iburst
EOF
 
sudo systemctl restart ntp &> /dev/null || true
sudo systemctl restart ntpd &> /dev/null || true
sudo service ntp restart &> /dev/null || true
sudo service ntpd restart &> /dev/null || true
sudo restart ntp &> /dev/null || true
sudo restart ntpd &> /dev/null || true
ntpq -p

echo "==> Installing fucking Python   "
sudo apt install software-properties-common zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.7 -y -qq 

sudo apt install python3.7-pip -y -qq 
sudo apt install python-pip -y -qq 
sudo apt-get install libssl-dev openssl -y 

echo "==> Docker, we are almost done i promise    "
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

#change uubuntu to whatever user name u have
sudo usermod -aG docker ubuntu
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
echo "==> I lied, we are not almost done   "
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo ufw allow 'Nginx HTTP'
sudo ufw status

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
echo "Host's IP Address..."
curl -4 icanhazip.com
echo "Welcome $USER to YOLO2077 "