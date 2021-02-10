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

# history file
export HISTFILE=~/Google\ Drive/blob/.zsh_history
# set history size
export HISTSIZE=1000000
export SAVEHIST=1000000
# share history between all sessions.
setopt SHARE_HISTORY
# do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
# append into history file
setopt INC_APPEND_HISTORY
# save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
# add timestamp for each entry
setopt EXTENDED_HISTORY

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"

# use different cursor styles for different modes in shell
VI_MODE_SET_CURSOR=true

# show stash icon
zstyle :prompt:pure:git:stash show yes

# used for poetry completion
fpath+=~/.dotfiles/python

# accept with completion with space for fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
# execute a command right after pressing enter for fzf-tab
zstyle ':fzf-tab:*' accept-line enter
