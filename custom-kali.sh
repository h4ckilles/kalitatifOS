#!/bin/sh

# On the road of a clean system
sudo apt purge -y `cat package-list/unwanted`
sudo apt update && sudo apt upgrade -y

# Software installation
./librewolf.sh
sudo apt install -y `cat package-list/wanted`
sudo apt autoremove -y

# Peripherals configuration
./touchpad.sh

# Bash config
./changeshell.sh
