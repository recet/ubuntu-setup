# Setup

Script to setup clean ubuntu.

## File descriptions

## Pre-installation steps

1. Make sure git is installed:

```bash
sudo apt-get install git
```

2. Make .sh files executable

```bash
find scripts/ -type f -iname "*.sh" -exec chmod +x {} \;
```

## Install programs

```bash
./scripts/main.sh
```

## Post-installation steps

### See our zsh changes

```bash
zsh
source ~/.zshrc
```

***All following post-installations steps are optional***

### Setup git user

Set username and email address

```bash
cat <<EOF > ~/.gitconfig.local
[user]
  name = your name
  email = your@email.com
EOF
```

#### Generating ssh keys

```bash
ssh-keygen -t rsa -b 4096
```

### Run Docker as a non-root user

```bash
sudo usermod -aG docker $(echo $USER)
```

### IBM cloud kubernetes kluster config

Note that default kubeconfig path is `~/.kube/config`, while IBM cloud uses different path.

The IBM kluster config can be added to the `KUBECONFIG` using export or creating a `~/.kubeconfig.local` file.

The .zshrc will look for `~/.kubeconfig.local` file.

To automatically overwrite/create `~/.kubeconfig.local` file, run the following script followed by the cluster name: `scripts/ibm-cloud/ibm-connect.sh CLUSTER_NAME`:

```bash
./scripts/ibm-cloud/ibm-connect.sh dev
```

The `~/.kubeconfig.local` file will now contain the path of both `~/.kube/config` and `~/.bluemix/plugins/container-service/clusters`.

### Test the setup script on a VM

Follow instructions [here](test/vagrant/vm-setup.md)
