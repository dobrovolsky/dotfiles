export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/dotfiles/bin:$PATH

export ZSH=$HOME/.oh-my-zsh


ZSH_THEME="xxf"

DISABLE_AUTO_UPDATE="true"

plugins=(
  git sublime zsh-syntax-highlighting zsh-autosuggestions zsh-nvm pyenv sublime golang docker docker-compose httpie)

source $ZSH/oh-my-zsh.sh

function command_exists () {
  command -v "$1"  > /dev/null 2>&1;
}

# set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Add go liblary to path
if command_exists go ; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"
# ALIASES
# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
alias ll="ls -laFh"
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
