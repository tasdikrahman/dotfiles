# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/tasdikrahman/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
  brew
  history
  kubectl
  git-flow
  zsh-autosuggestions
  git-open
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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# autojump source
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh]
source /usr/local/etc/profile.d/autojump.sh
#[[ -s brew --prefix/etc/autojump.zsh ]] && . brew --prefix/etc/autojump.zsh

# mkvirtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# alias
alias ls="ls -la"

# ruby
alias be='bundle exec'

# docker aliases
function dcleanup(){
    docker rm `docker ps --no-trunc -aq` && \
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null && \
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# terraform aliases
#alias tfplan='terraform plan -out=.tfplan -refresh=false'
alias tfplan='terraform plan -out=.tfplan'
alias tfapply='terraform apply .tfplan; rm .tfplan'

# adding laravel bin path
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# kubectl aliases
alias kontext='kubectl config use-context'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpn='kubectl get pods -o wide -n '
alias kgpa='kubectl get pods --all-namespaces'
alias kno='kubectl get nodes'
alias k='kubectl'
function kpssh { kubectl exec -it $1 -n $2 sh  }
function kgpc { kubectl get pods -n $1 }
function kgl { kubectl logs $1 -n $2 }
function kcssh { kubectl exec -it $1 -n $2 -c $3 sh  }
function klog { kubetail $1 -n $1  }
function kne { kubectl get events -n $1 --sort-by='.metadata.creationTimestamp'  -o 'go-template={{range .items}}{{.involvedObject.name}}{{"\t"}}{{.involvedObject.kind}}{{"\t"}}{{.message}}{{"\t"}}{{.reason}}{{"\t"}}{{.type}}{{"\t"}}{{.firstTimestamp}}{{"\n"}}{{end}}'  }
function kne() {
    kubectl get events -n $1 --sort-by='.metadata.creationTimestamp' \
    -o 'go-template={{range .items}}{{.involvedObject.name}}{{"\t"}}{{.involvedObject.kind}}{{"\t"}}{{.message}}{{"\t"}}{{.reason}}{{"\t"}}{{.type}}{{"\t"}}{{.firstTimestamp}}{{"\n"}}{{end}}'
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tasdikrahman/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tasdikrahman/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tasdikrahman/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tasdikrahman/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export GOPATH=$HOME/development/goworkspace
export PATH=$PATH:$GOPATH/bin

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

export KUBE_EDITOR=vim

autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[cyan]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
#RPROMPT='%{$fg_bold[blue]%} %D %T % %{$reset_color%} {$fg[cyan]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# k8s zsh context
autoload -U colors; colors
RPROMPT='%{$fg[red]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
