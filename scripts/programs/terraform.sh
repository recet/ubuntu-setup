#!/usr/bin/env bash

TERRAFORM_VERSION="0.12.6"

if hash terraform 2>/dev/null; then
  echo "terraform already installed. Use tfswitch to change versions"
  exit 0
fi

if hash tfswitch 2>/dev/null; then
  tfswitch -b ~/bin/terraform $TERRAFORM_VERSION
fi
