#!/bin/bash

# Set working directory to current directory
WORKING_DIR=$(dirname "$0")
cd $WORKING_DIR

# Run all installation scripts
./aptinstall.sh
./snapinstall.sh
./programs.sh
./pip3install.sh
./symlink.sh

# Get all upgrades
sudo apt upgrade -y

# Set zsh as default shell
sudo chsh -s $(which zsh)

# Finishing message
echo "All set up!"