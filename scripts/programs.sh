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
install code
install docker
install kubectl
install gcloud # google-cloud-cli
install az # azure-cli
install minikube
install slack
install kubectx
install spotify
install circleci
install helm
install node
install apigeetool
install terraform
install google-chrome
install vault
install ibmcloud
install atom

# Preferred
install nordvpn

# Update code additional settings
./programs/code-settings.sh

