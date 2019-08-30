export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/dotfiles/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32

if [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then 
    ZSH_TMUX_AUTOSTART=true
fi

DISABLE_AUTO_UPDATE="true"

function command_exists () {
  command -v "$1"  > /dev/null 2>&1;
}

plugins=(
  zsh-syntax-highlighting 
  zsh-autosuggestions 
)

if command_exists git ; then
  plugins+=(git gitfast)
fi

if command_exists tmux ; then
  plugins+=(tmux)
fi

if command_exists pyenv ; then
  plugins+=(pyenv)
fi

if command_exists go ; then
  plugins+=(golang)
fi

if command_exists docker ; then
  plugins+=(docker docker-compose)
fi

if command_exists httpie ; then
  plugins+=(httpie)
fi

if command_exists poetry ; then
  plugins+=(poetry)
fi

source $ZSH/oh-my-zsh.sh

fpath=("$ZSH/custom/plugins/pure" $fpath )
autoload -U promptinit; promptinit
prompt pure

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

# ALIASES
# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

if command_exists exa ; then
  alias ll="exa --group-directories-first --color=always --long --git --all"
  alias tree="ll --tree"
else
  alias ll="ls -la"
fi
# Convert timestamp to date by UTC
alias ts="date -u -r"
# Get current time in timestamp
alias tsn="date +%s"
# Apply theme for bat
alias bat="bat --theme=base16"
# Alias for tig
alias tg="tig"

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Get length of string
function len(){
  string=$@
  echo ${#string}
}
