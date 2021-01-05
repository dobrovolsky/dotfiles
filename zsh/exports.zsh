# brew
PATH=$HOME/bin:/usr/local/bin:$PATH
# local bin in dotfiles
PATH=$HOME/.dotfiles/bin:$PATH
# pyenv bin
PATH="$HOME/.pyenv/bin:$PATH"
# golang bin
PATH="$HOME/go/bin:$PATH"

export PATH

export EDITOR="nvim"

# set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# use custom settings for bat
export BAT_CONFIG_PATH=$HOME/.bat.conf

# custom settings for cht.sh
export CHTSH_CONF=$HOME/.dotfiles/cht.conf

# don't start tmux in ide and ssh terminals
if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ] ||
   [ -n "$SSH_CONNECTION" ]; then
    ZSH_TMUX_AUTOSTART=false
else
    ZSH_TMUX_AUTOSTART=true
fi

# allow JetBrains' IDEAs to access history
HISTFILE=~/.zsh_history

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"

# show stash icon
zstyle :prompt:pure:git:stash show yes

# used for poetry completion
fpath+=~/.dotfiles/python
