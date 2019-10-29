#!/bin/bash

# Instructions from https://minikube.sigs.k8s.io/docs/start/linux/

# Download latest
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
   && sudo install minikube-linux-amd64 /usr/local/bin/minikube

rm minikube-linux-amd64

# Verify that your system has virtualization support enabled
egrep -q 'vmx|svm' /proc/cpuinfo && echo "System has virtualization support enabled" || \
echo "HEY! System virtualization support NOT enabled! Minikube might not work!"

# Set default driver - virtualbox
minikube config set vm-driver virtualbox
