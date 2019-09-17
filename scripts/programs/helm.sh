#!/usr/bin/env bash

# Instructions from https://helm.sh/docs/using_helm/#from-script

curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh --version v2.13.1

rm get_helm.sh
