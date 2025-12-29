# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias be="bundle exec"
alias vim="nvim"
alias tf="HTTPS_PROXY=http://127.0.0.1:18443/ terraform"
alias k="HTTPS_PROXY=http://127.0.0.1:18443/ kubectl"
alias k9="HTTPS_PROXY=http://127.0.0.1:18443/ k9s"
alias kcd='k config set-context $(k config current-context) --namespace '
alias less='bat'
alias cat='bat --paging=never'

# EDITOR
export EDITOR=vim
export KUBE_EDITOR=vim

# FZF wiht AG
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NODENV
eval "$(nodenv init -)"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# Puppeteer chromium install
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Kubernetes
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Go
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(atuin init zsh)"

# user bin
export PATH="$PATH:$HOME/bin"
