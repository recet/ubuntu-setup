#!/bin/bash

# Visual Studio Code Plugins and settings
echo "Visual Studio Code Plugins and settings..."

# Override settings.json file 
sudo chown -hR $USER:$USER ~/.config
mkdir -p $HOME/.config/Code/User
touch -a $HOME/.config/Code/User/settings.json # make sure file exists - doesnt exists if code is never started
sudo ln -sf $(pwd)/../vsc_settings.json $HOME/.config/Code/User/settings.json

# Install extensions
function install {
  name="${1}"
  code --install-extension ${name} --force
}
install ms-python.python
install CoenraadS.bracket-pair-colorizer
install DavidAnson.vscode-markdownlint
install rpinski.shebang-snippets
install eamodio.gitlens
install 42Crunch.vscode-openapi
install MS-vsliveshare.vsliveshare
install wwm.better-align
install DotJoshJohnson.xml
install Atlassian.atlascode
install eamodio.gitlens
install VisualStudioExptTeam.vscodeintellicode
install 4ops.terraform
