export ZSH=/Users/bogdan/.oh-my-zsh

ZSH_THEME="xxf"

DISABLE_AUTO_UPDATE="true"

plugins=(
  git sublime zsh-syntax-highlighting zsh-autosuggestions
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIASES
# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
alias ll="ls -la"

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}
