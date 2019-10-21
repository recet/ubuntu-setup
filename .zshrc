# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit" #ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    kubectl
    kube-ps1
    helm
    terraform
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


##############################################################################
# History Configuration
##############################################################################
HISTSIZE=10000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed


##############################################################################
# Alias Configuration
##############################################################################
alias cp='cp -rv'
alias ls='ls --color=auto -CF'
alias l='ls --color=auto -alF'
alias ll='ls --color=auto -lF'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias wget='wget -c'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias cl='clear'

alias gadd='git add'
alias gcom='git commit'
alias gsup='git status'

alias python='python3'
alias pip='pip3'
alias pym='python3 manage.py'
alias mkenv='python3 -m venv env'
alias startenv='source env/bin/activate && which python3'
alias stopenv='deactivate'

alias kc='kubectl'
alias kstatus='kubectl get pods --all-namespaces -o wide|grep -v "1/1\|2/2\|3/3\|4/4"'
alias kx='kubectx'
alias kn='kubens'


##############################################################################
# Auto-completion Configuration
##############################################################################
source ~/.oh-my-zsh/plugins/git-flow/git-flow.plugin.zsh
autoload -U compinit && compinit
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


##############################################################################
# Functions Configuration
##############################################################################

#### Kubernetes Stuff ####

# Check for local KUBECONFIG path (used for merged kubeconfig path - IBM)
if [ -f ~/.kubeconfig.local ] ; then
    export KUBECONFIG=$(cat ~/.kubeconfig.local)
fi

# Kube-ps1
# Kubeon or kubeoff
export KUBE_PS1_PREFIX=' '
export KUBE_PS1_SUFFIX=''
export KUBE_PS1_COLOR_SYMBOL="%F{cyan}"
export KUBE_PS1_COLOR_CONTEXT="%F{cyan}"
export KUBE_PS1_COLOR_NS="%F{magenta}"
PROMPT='$(kube_ps1) $(tf_prompt_info) %f'$PROMPT

# Get pods with maching name
function pods {
  if [[ "x" == "x$1" ]] ; then
    kubectl get pods -o wide 
  else
    kubectl get pods -o wide | grep "^$1"
  fi
}

# Count pods 
function podcount {
  echo "Show the node names with a count of pods associated with them"
  kubectl get pods --no-headers=true -o wide --all-namespaces | awk '{ print $8}' | sort |uniq -c
}

# Exec into pods
function kcexec {
  if [[ "x" == "x$1" ]] ; then
    echo "You must supply the name (or part of the name) of the pod you wish to enter"
    return
  fi
  NAME=$( kubectl get pods -o wide | grep -v " 0/\|Terminating" | grep "^$1" | cut -d ' ' -f 1 | head -1 )
  if [[ "x" == "x$NAME" ]] ; then
    echo "Could not find any running pods with the given filter"
    return
  fi
  shift
  COMMAND="$*"
  if [[ "x" == "x$COMMAND" ]] ; then
    COMMAND="bash"
  fi
  echo "Executing the following command in $NAME : $COMMAND"
  kubectl exec -it $NAME -- $COMMAND
}

# Log pod
function logs {
  if [[ "x" == "x$1" ]] ; then
    echo "Please indicate which pod you want to tail for json log"
    exit 1
  fi
  NAME=$( kubectl get pods -o wide | grep -v " 0/\|Terminating" | grep "^$1" | cut -d ' ' -f 1 | head -1 )
  if [[ "x" == "x$NAME" ]] ; then
    echo "Could not find any running pods with the given filter"
    return
  fi
  echo "In effect doing: kubectl logs -f $NAME"
  kubectl logs -f $NAME | grep "^{" | jq '{message}[]'
  # Did not work correctly: | sed 's|\\n"$||g' | sed 's|^"||g'
}



