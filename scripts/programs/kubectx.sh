#!/bin/bash

# Instructions https://github.com/ahmetb/kubectx

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

# Interactive list - Instructions https://github.com/junegunn/fzf
if [ ! -d ~/.fzf ]; then
    echo "git cloning fzf.."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    y | ~/.fzf/install
else
    echo ".fzf exist... skipping"
fi