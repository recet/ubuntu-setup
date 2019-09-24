#!/bin/bash

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
    clustername=$(awk '/current-context/{print $2}' < $file)
    if [[ ! $clustername =~ ibm-.* ]]; then
        sed -i.bak "/\ $clustername/s/$clustername/ibm-$clustername/g" $file && rm $file.bak
        sed -i.bak "/$clustername-$username/!s/$username/$clustername-$username/g" $file && rm $file.bak
    fi
    mergedconfig="$mergedconfig:$file"
done < <(find $clustersdir -type f -name "*.yml" -print0)
echo $mergedconfig > ~/.kubeconfig.local

echo $mergedconfig
echo "Added KUBECONF string to ~/.kubeconfig.local"
echo "You might need to run: 'source ~/.zshrc' or start new terminal"