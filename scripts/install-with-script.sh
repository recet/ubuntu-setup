#!/bin/bash

cd programs/

# Skip installed programs
function install {
  command -v $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "
          ######################################
          ######################################
          ######################################
          #               ${1}                 #
          ######################################
          ######################################
          ######################################
        "
        echo "Running: .programs/${1}.sh..."
        ./${1}.sh
    else
        echo "Already installed: ${1}...Skipping: ./programs/${1}.sh"  
    fi
}

# Programs
install az # azure-cli
install kubectx
install google-chrome
install nordvpn
install ibmcloud
install terraform
install tfswitch

# Update code additional settings
./mscode-settings.sh
