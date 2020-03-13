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
#plugins=(
#  git asdf osx
#)

export CLONE_ROOT=~/src/pagero/
export GITOSIS_CONF=$CLONE_ROOT/gitosis-admin/gitosis.conf
export GIT_USER=git
export GIT_HOST=git

source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle osx
#antigen bundle pip
antigen bundle command-not-found
antigen bundle goto
antigen bundle clone

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# iTerm2 shell integration:
source ~/.iterm2_shell_integration.zsh

# Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Homebrew
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

# Golang:
export GOPATH="/Users/victorsollerhed/go"
export PATH="$PATH:/Users/victorsollerhed/go/bin"

# Istio:
export PATH="$PATH:/Users/victorsollerhed/src/pagero/other-libraries/istio-0.4.0/bin"

# ASDF version manager:
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# Google Cloud SDK (gcloud etc):
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Helm:
source <(helm completion zsh)
source <(kubectl completion zsh)

# My scripts:
export PATH="$PATH:/Users/victorsollerhed/.bin"
#export EDITOR=vim
export EDITOR='code --wait'

# Pagero custom:
export SERVICES_LOG_DIRECTORY=/private/var/log/services/
export SERVICES_BACKUP_DIRECTORY=/private/var/backup/
export SERVICES_DIRECTORY=/private/var/services/

# Texttest pagero source root:
export SOURCE_ROOT=~/src/git.pagero.local

# Kubernetes addon manager "Krew":
# https://github.com/GoogleContainerTools/krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

