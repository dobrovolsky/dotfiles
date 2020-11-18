# brew
PATH=$HOME/bin:/usr/local/bin:$PATH
# local bin in dotfiles
PATH=$HOME/.dotfiles/bin:$PATH
# pyenv bin
PATH="$HOME/.pyenv/bin:$PATH"
# golang bin
PATH="$PATH:$(go env GOPATH)/bin"

export PATH

if [[ "$(uname)" == "Darwin" ]]; then
  export OS="Mac"

elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  export OS="Linux"

elif [[ "$(expr substr  $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
  export OS="MinGW"
fi

# set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# use custom settings for bat
export BAT_CONFIG_PATH=$HOME/.bat.conf

# don't start tmux in ide and ssh terminals
if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ] ||
   [ -n "$SSH_CONNECTION" ]; then
    ZSH_TMUX_AUTOSTART=false
else
    ZSH_TMUX_AUTOSTART=true
fi

# allow JetBrains' IDEAs to access history
HISTFILE=~/.zsh_history

# don't store command in hystory if starts with space
HIST_IGNORE_SPACE="true"

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"

# init nodenv (should run nodenv rehash when installing cli)
eval "$(nodenv init --no-rehash - zsh)"

# init pyenv (should run pyenv rehash when installing cli)
eval "$(pyenv init --no-rehash - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# show stash icon
zstyle :prompt:pure:git:stash show yes
