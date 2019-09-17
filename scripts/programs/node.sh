#!/usr/bin/env bash

# Instructions from https://github.com/nodesource/distributions/blob/master/README.md#debinstall
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt-get update
sudo apt-get install nodejs

node -v
npm -v
