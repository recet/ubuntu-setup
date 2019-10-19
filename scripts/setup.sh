#!/bin/bash

# Set working directory to current directory
WORKING_DIR=$(dirname "$0")
cd $WORKING_DIR

# Get all upgrades
sudo apt --fix-broken install -y
sudo apt-get update
sudo apt upgrade -y

# Run all installation scripts
./aptinstall.sh
./snapinstall.sh
./programs.sh
./pip3install.sh
./oh-my-zsh.sh
./symlink.sh
./additional-os-settings.sh

# Get all upgrades
sudo apt --fix-broken install -y
sudo apt-get update
sudo apt upgrade -y

# Set zsh as default shell
sudo chsh -s $(which zsh)

# Finishing message
echo "All set up!"