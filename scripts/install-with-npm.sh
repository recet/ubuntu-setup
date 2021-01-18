#!/bin/bash

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
        sudo npm install -g $@
    else
        echo "Already installed: ${1}..."        
    fi
}

# Essentials 
install apigee
install tldr