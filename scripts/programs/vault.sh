#!/usr/bin/env bash

VAULT_VERSION="1.2.3"
FILE_NAME="vault_${VAULT_VERSION}_linux_amd64.zip"


wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/${FILE_NAME}

sudo mkdir -p /opt/vault/
sudo unzip ${FILE_NAME} -d /opt/vault 

sudo ln -sf /opt/vault/vault /usr/local/bin/vault

rm ${FILE_NAME}
