# Setup

Setup script for ubuntu.

## File descriptions

* `symlink.sh` sets up symlinks in `$HOME`
* `aptinstall.sh` is for Ubuntu repository installs
* `programs.sh` is for other software
* `desktop.sh` is for GNOME desktop settings
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
