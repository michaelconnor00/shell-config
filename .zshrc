
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

## Install Spaceship
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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
  gitfast
  git
  brew
  docker
  z
  npm
  zsh-better-npm-completion # https://github.com/lukechilds/zsh-better-npm-completion
  fabric
  kubectl
  helm
  kops
  terraform
  fzf # https://github.com/junegunn/fzf
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  history-substring-search # https://github.com/zsh-users/zsh-history-substring-search
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
  kubetail # https://github.com/johanhaleby/kubetail
)

source $ZSH/oh-my-zsh.sh

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Kubernetes
export KUBECONFIG=$HOME/.kube/config
# for file_name in ~/.kube/*config.yaml; do
#   export KUBECONFIG=$KUBECONFIG:${file_name}
# done

alias mk="minikube"
alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"

alias kctx="kubectx"
alias kns="kubens"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv helper
eval "$(direnv hook zsh)"

# Python
export VENV_ROOT=$HOME/.local/share/virtualenvs
export PATH="$HOME/.poetry/bin:$PATH"
fpath+=~/.zfunc

#export NVM_DIR="$HOME/.nvm"
#[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/mikeconnor/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/mikeconnor/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/mikeconnor/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/mikeconnor/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# asdf 
. /home/linuxbrew/.linuxbrew/opt/asdf/asdf.sh
. /home/linuxbrew/.linuxbrew/opt/asdf/etc/bash_completion.d/asdf.bash

eval "$(pipenv --completion)"

