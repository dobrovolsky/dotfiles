export ZSH=/Users/bogdan/.oh-my-zsh

ZSH_THEME="xxf"

DISABLE_AUTO_UPDATE="true"

plugins=(
  git sublime zsh-syntax-highlighting zsh-autosuggestions zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Add go liblary to path
export PATH="$PATH:$(go env GOPATH)/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIASES
# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
alias ll="ls -la"
# Convert timestamp to date by UTC
alias ts="date -u -r"
# Get current time in timestamp
alias tsn="date +%s"

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Get length of string
function len(){
  string=$@
  echo ${#string}
}
