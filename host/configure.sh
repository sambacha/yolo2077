#!/bin/bash
# pipefail disabled cause reasoons here 
# set -eo pipefail
 
# /**  Fresh System (We Assume) */
echo -ne "==> Setting up host system..."

sudo apt-get update  -qq
sudo apt-get upgrade -y -qq
sudo apt update -qq
sudo apt-get upgrade -qq --skip-keypress --checkall
#---------------------------------#
# Install System Build Req.
#---------------------------------#
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
echo -ne "==> Installing Java 11..."
 
# <!-- INSTALL JAVA -->
sudo apt-get -qq -y --no-install-recommends install gnupg locales
# <!-- INSTALL JAVA: GPG KEYS -->
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
# <!-- INSTALL JAVA: AZUL REPO -->
sudo apt-add-repository "deb http://repos.azulsystems.com/ubuntu stable main"
# <!-- INSTALL JAVA: INSTALL JAVA FINALLY -->
sudo apt-get -qq -y --no-install-recommends install zulu-11=11.39+15
sudo apt-get update -qq

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

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

sudo apt install software-properties-common zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.7

sudo apt install python3.7-pip -y
sudo apt install python-pip -y
sudo apt-get install libssl-dev openssl -y

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


sudo ufw allow 'Nginx HTTP'
sudo ufw status

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
echo "Host's IP Address..."
curl -4 icanhazip.com