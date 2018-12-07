# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="mh"
#ZSH_THEME="bira"
#ZSH_THEME="gnzh"
#ZSH_THEME="terminalparty"
ZSH_THEME="" # pure theme

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMP=mmm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  docker 
  z 
  fabric 
  kubectl 
  helm 
  kops 
  terraform
  zsh-autosuggestions 
  history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/.oh-my-zsh/z/z.sh

# Pure Prompt
# https://github.com/sindresorhus/pure#getting-started
autoload -Uz promptinit; promptinit

# optionally define some options
#PURE_CMD_MAX_EXEC_TIME=10

prompt pure

# User configuration
# export PATH=$PATH:/anaconda/bin

export EDITOR="nvim"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshrc="nvim ~/.zshrc"

# Docker functions
dkrm (){
    docker rm $(docker ps -a -q --filter 'status=exited') &>/dev/null
}

dkrmi (){
    docker rmi $(docker images -q --filter 'dangling=true') &>/dev/null
}

dkrmv (){
    docker volume rm $(docker volume ls -qf dangling=true) &>/dev/null
}

# Personal
export SPK=$HOME/Documents/SparkGeo
export GHP=$HOME/Documents/GitHubProjects
export VAG=$HOME/Documents/SparkGeo/Vagrant
export WORK=$HOME/Documents/SparkGeo/workspaces

# Kubernetes
export KUBECONFIG=$HOME/.kube/config
for file_name in ~/.kube/*config.yaml; do
  export KUBECONFIG=$KUBECONFIG:${file_name}
done

# https://github.com/superbrothers/zsh-kubectl-prompt
autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

alias mk="minikube"
alias k="kubectl"
alias kg=" kubectl get"
alias kd="kubectl describe"
alias kctx="kubectx"
alias kns="kubens"

# GoLang, homebrew install
#export $GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true

# func to install global pip packages
# gpip(){
#    PIP_REQUIRE_VIRTUALENV="" pip "$@"
# }

# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv helper
eval "$(direnv hook zsh)"

# completions
#eval "$(pipenv --completion)"
