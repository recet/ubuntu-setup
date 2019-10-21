# Setup

Setup script for ubuntu.

## File descriptions

* `oh-my-zsh.sh` is to download oh-my-zsh
* `aptinstall.sh` is for Ubuntu repository installs
* `snapinstall.sh` is for snap repository installs
* `programs.sh` is for other software
* `pip3install.sh` isfor pip packages
* `symlink.sh` sets up symlinks in `$HOME`
* `additional-os-settings.sh` is for some desktop settings
* `setup.sh` runs all the scripts and `apt upgrade`

## Pre-installation steps

### Make .sh files executable

```bash
find scripts/ -type f -iname "*.sh" -exec chmod +x {} \;
```

## Install programs

```bash
./scripts/setup.sh
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