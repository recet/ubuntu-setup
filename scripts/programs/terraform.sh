#!/usr/bin/env bash

TERRAFORM_VERSION="0.12.6"
FILE_NAME="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"


wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${FILE_NAME}

sudo mkdir -p /opt/terraform/
sudo unzip ${FILE_NAME} -d /opt/terraform 

sudo ln -sf /opt/terraform/terraform /usr/local/bin/terraform

rm ${FILE_NAME}
