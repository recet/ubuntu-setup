#!/bin/bash

function install {
    QUERY=$(snap info ${1} | grep "name:" | cut --delimiter=':' -f 2 | xargs)

    shopt -s nocasematch # Make caseinsentive
    if [[ $QUERY == *"${1}"* ]]; then
        echo "Already installed: ${1}... $QUERY"
    else
        echo "Installing: ${1} ..."
        sudo snap install ${1}
    fi
}

# Essentials 
install teams-for-linux
install insomnia