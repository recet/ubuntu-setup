#!/bin/bash

# if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then

#     echo "
#           ######################################
#           ######################################
#           ######################################
#           #           oh-my-zsh                #
#           ######################################
#           ######################################
#           ######################################
#         "
#     echo "Install oh-my-zsh.."
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# else
#     echo "Already installed: ~/.oh-my-zsh exist... skipping"
# fi

#!/bin/bash

if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then

    echo "
          ######################################
          ######################################
          ######################################
          #           oh-my-zsh                #
          ######################################
          ######################################
          ######################################
        "
    echo "git cloning oh-my-zsh.."
    mkdir -p ~/tmp
    mkdir -p ~/.oh-my-zsh
    rm -rf ~/tmp/oh-my-zsh/
    git clone  https://github.com/robbyrussell/oh-my-zsh.git ~/tmp/oh-my-zsh/
    rsync -a -v -r ~/tmp/oh-my-zsh/* ~/.oh-my-zsh/
    rm -rf ~/tmp/oh-my-zsh/
else
    echo "Already installed: ~/.oh-my-zsh exist... skipping"
fi
