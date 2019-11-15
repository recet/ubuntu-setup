#!/bin/bash

# Instructions mostly copied from https://gist.github.com/dcberg/7e03a8363b30663ad20aeebf4a0f9663

# Note the value is the IBM ID used to log into ibmcloud. This is the same
# value that appears in the downloaded IKS cluster config files for the
# context user field.
if [ -z "$1" ]
then
      read -p 'IBM ID (email): ' username
else
      username="$1" #set to IBM ID used with ibmcloud login
fi

# IBM Cloud Kubernetes Service cluster config dir
clustersdir=~/.bluemix/plugins/container-service/clusters

# Produce a Kubernetes merged config string to be used with the KUBECONF environment variable.
# Write the output to /.kubeconfig.local
mergedconfig="$HOME/.kube/config"
while IFS= read -r -d '' file
do
    clusterstring=$(awk '/current-context/{print $2}' < $file)
    clusterid=$(echo $clusterstring | cut -d'/' -f2)
    clustername=$(echo $clusterstring | cut -d'/' -f1)
    if [[ ! $clusterstring =~ ibm-.* ]]; then
        sed -i.bak "/\ $clustername\/$clusterid/s/$clustername\/$clusterid/ibm-$clustername/g" $file && rm $file.bak
    fi
    mergedconfig="$mergedconfig:$file"
done < <(find $clustersdir -type f -name "*.yml" -print0)
echo $mergedconfig > ~/.kubeconfig.local

echo $mergedconfig
echo "Added KUBECONF string to ~/.kubeconfig.local"
echo "You might need to run: 'source ~/.zshrc' or start new terminal"
