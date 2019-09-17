#!/bin/bash

# Instructions from https://slack.com/intl/en-no/downloads/linux

# Download
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

# Install
sudo apt install -y ./slack-desktop-*.deb

# Remove file
rm slack-desktop-*.deb 
