#!/bin/bash

sudo apt update

function install {
    QUERY=$(dpkg-query -W -f='${Status} ${Version}\n' ${1})

    if [[ $QUERY != *"not-installed"* ]]; then
        echo "Already installed: ${1}... $QUERY"
    else
        echo "Installing: ${1}..."
        sudo apt install -y $1
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
install curl
install wget
install jq
install unzip
install zsh
install git
install keychain
install xclip
install snapd
install virtualbox
install virtualbox-qt

# Fundementals
install nmap
install firefox
install libreoffice
install vim
install terminator
install tilda
install gnome-tweaks
install htop
