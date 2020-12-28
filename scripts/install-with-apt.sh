#!/bin/bash

sudo apt update

function install {
    QUERY=$(apt-cache policy ${1})

    if [[ $QUERY = *"Installed: (none)"* ]]; then
        echo "
          ######################################
          ######################################
          ######################################
          #               ${1}                 #
          ######################################
          ######################################
          ######################################
        "
        echo "Installing: ${1}..."
        sudo apt install -y $@
    else
        echo "Already installed: ${1}..."        
    fi
}

# Essentials 
install python3-venv 
install python3-pip
install build-essential
install apt-transport-https
install ca-certificates
install gnupg-agent
install software-properties-common
install powerline 
install fonts-powerline
install ppa-purge
install rsync
install curl
install wget
install jq
install yq
install unzip
install zsh
install git
install keychain
install xclip
install snapd
install virtualbox
install virtualbox-qt
install vagrant
install awscli
install apache2-utils
install nmap
install libreoffice
install vim
install gnome-tweaks
install htop
install ipcalc
install pcregrep
install lm-sensors # To measure hardware temp
install hddtemp    # To measure hardware temp
install psensor    # To measure hardware temp