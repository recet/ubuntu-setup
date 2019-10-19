#!/bin/bash

if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    echo "git cloning oh-my-zsh.."
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    echo "Already installed: ~/.oh-my-zsh exist... skipping"
fi
