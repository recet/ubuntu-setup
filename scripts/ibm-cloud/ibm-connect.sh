#!/bin/bash

# Connect to your ibm environment and download clusterconfig

# Requirements: 
# - Create IBM CLoud API and save to ~/.ssh/
# - Create IBM Classic infrastructure API key and save credentials and keys to ~/.ssh/

# Usage: ibm-connect.sh CLUSTER_NAME

# exit when any command fails
set -e

WORKING_DIR=$(dirname "$0")
cd $WORKING_DIR

ENV=${1:-default}

APIKEY=~/.ssh/$ENV-ibm
INFRA_APIKEY_USER=~/.ssh/$ENV-ibm-sl-username
INFRA_APIKEY=~/.ssh/$ENV-ibm-sl


echo $APIKEY
if [[ ! -f "$APIKEY" || ! -f "$INFRA_APIKEY_USER" || ! -f "$INFRA_APIKEY" ]]; then
    echo "One of the following required keys do not exist:"
    echo $APIKEY
    echo $INFRA_APIKEY
    echo $INFRA_APIKEY_USER

    echo "Exit operation..."
    exit 1
fi
  
echo "ibmcloud set cluster config to "$ENV""

#set the correct api-key for each project 
export TF_VAR_ibm_bx_api_key="$(cat ~/.ssh/$ENV-ibm)"
export TF_VAR_ibm_sl_username="$(cat ~/.ssh/$ENV-ibm-sl-username)"
export TF_VAR_ibm_sl_api_key="$(cat ~/.ssh/$ENV-ibm-sl)"

# we do not want any interupts about version number
ibmcloud config --check-version=false

# log in  using the api-key
ibmcloud login -g Default -r eu-de --apikey $TF_VAR_ibm_bx_api_key

# Get the username of the currently logged in IBM cloud user
username=$(ibmcloud target |grep User | awk '{print $2}')

# Downloads the Kubernetes config in IBMCloud....
ibmcloud ks cluster config $ENV > /dev/null
./iks-merged-config.sh $username
 

# Log into softlayer
# ibmcloud sl init -u $TF_VAR_ibm_sl_username -p $TF_VAR_ibm_sl_api_key

# # Change Terraform workspace
# if [ -n "$(terraform workspace list | grep -e dev)" ]; then
#     terraform workspace select $ENV
# fi


