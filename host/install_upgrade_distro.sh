#!/usr/bin/env bash
set -e
set -x
 
### config
REBOOT=1
### config
 
# never prompt
export DEBIAN_FRONTEND=noninteractive
 
# install the backported kernel
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get update
 
# reboot
if [ "$REBOOT" = 1 ]; then
  sudo reboot
fi
