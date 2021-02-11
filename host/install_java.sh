#!/usr/bin/env bash

# install Zulu JDK

sudo apt-get -qq update
sudo apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
sudo apt-add-repository "deb http://repos.azulsystems.com/ubuntu stable main"
sudo apt-get -qq update
sudo apt-get -qq -y dist-upgrade
sudo apt-get -qq -y --no-install-recommends install zulu-11

