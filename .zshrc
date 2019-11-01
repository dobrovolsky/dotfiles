export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/dotfiles/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32

if [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then 
    ZSH_TMUX_AUTOSTART=true
fi

DISABLE_AUTO_UPDATE="true"
export ENABLE_VPNSTATUS="true"

if [[ "$(uname)" == "Darwin" ]]; then
    export OS="Mac"

elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    export OS="Linux"
    # to run copy in macos and ubuntu in same way
    alias pbcopy="xclip -selection clipboar"

elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    export OS="MinGW"
fi

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
alias bat="bat --theme=Monokai\ Extended\ Light"

# Automatically list directory contents on `cd`.
auto-ls () {
  if [ $HOME != "$(pwd)" ]; then 
	  ll
  fi
}
chpwd_functions=( $chpwd_functions auto-ls)

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Get length of string
function len(){
  string=$@
  echo ${#string}
}

function fzf-log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}


function fzf-log-preview() {
  _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

  git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@" |
      fzf --no-sort --reverse --tiebreak=index --no-multi \
          --ansi --preview="$_viewGitLogLine" \
              --header "enter to view, alt-y to copy hash" \
              --bind "enter:execute:$_viewGitLogLine   | less -R" \
              --bind "alt-y:execute:$_gitLogLineToHash | pbcopy"
}

alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
