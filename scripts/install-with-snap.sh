#!/bin/bash

function install {
    QUERY=$(snap info ${1} | grep "installed" | cut --delimiter=':' -f 1 | xargs)

    shopt -s nocasematch # Make caseinsentive
    if [[ $QUERY == *"installed"* ]]; then
        echo "Already installed: ${1}... $QUERY"
    else
        echo "
          ######################################
          ######################################
          ######################################
          #               ${1}                 #
          ######################################
          ######################################
          ######################################
        "
        echo "Installing: ${1} ..."
        sudo snap install $@
    fi
}

# Essentials 
install code
install docker
install kubectl --classic
install google-cloud-sdk --classic
install slack --classic
install spotify
install circleci
install helm --classic
install node --classic
install vault
install atom --classic
install teams-for-linux