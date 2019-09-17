#!/bin/bash

cd programs/

# Skip installed programs
function install {
  which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Running: .programs/${1}.sh..."
        ./${1}.sh
    else
        echo "Already installed: ${1}...Skipping: ./programs/${1}.sh"  
    fi
}

# Programs
install python3
install code
install docker
install kubectl
install gcloud # google-cloud-cli
install aws # aws-cli
install az # azure-cli
install minikube
install slack
install kubectx
install spotify
install circleci
install helm
install oh-my-zsh
install node
install apigeetool
install terraform
install google-chrome

# Update additional settings
./code-settings.sh