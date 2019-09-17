#!/bin/bash

sudo apt update

function install {
    QUERY=$(dpkg-query -W -f='${Status} ${Version}\n' ${1})

    if [[ $QUERY == *"installed"* ]]; then
        echo "Already installed: ${1}... $QUERY"
    else
        echo "Installing: ${1}..."
        sudo snap install $1
    fi
}

# Essentials 
install teams-for-linux
install insomnia