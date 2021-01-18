#!/bin/bash

# Set working directory to current directory
WORKING_DIR=$(dirname "$0")
cd $WORKING_DIR

# Get all upgrades
sudo apt --fix-broken install -y
sudo apt-get update
sudo apt upgrade -y

# Run installation scripts
./install-oh-my-zsh.sh # Setup oh-my-zsh
./install-with-apt.sh # install apps with abt
./install-with-snap.sh # install apps with snap
./install-with-script.sh # install apps with custom script
./install-with-npm.sh
./install-with-pip3.sh
./configure-symlink.sh
./configure-os.sh

# Get all upgrades
sudo apt --fix-broken install -y
sudo apt-get update
sudo apt upgrade -y

# Set zsh as default shell
sudo chsh -s $(which zsh)

# Finishing message
echo "All set up!"