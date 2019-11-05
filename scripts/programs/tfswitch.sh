#!/bin/bash

# Instructions https://warrensbox.github.io/terraform-switcher/

# Create ~/bin folder where tfswitch will place symlinks to the terraform binaries when run. By using the tfswitch -b flag the executable is placed in this bin folder instead of the default location to avoid having to run terraform with sudo rights. This is configured by setting an alias in the .zshrc file. 
mkdir -p ~/bin

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash

