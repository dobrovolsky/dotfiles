export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/dotfiles/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32

DISABLE_AUTO_UPDATE="true"
LS_ON_CD=true

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
  z
  git 
  gitfast
  web-search
  kubectl
  colored-man-pages
  extract
)

if command_exists tmux ; then
    plugins+=(tmux)

    ZSH_TMUX_AUTOSTART=true

    JB="JetBrains-JediTerm"
    VC="VSCODE"
    
    if [ "$TERMINAL_EMULATOR" = "$JB" ] || [ "$TERMINAL_EMULATOR" = "$VC" ] || [ -n "$SSH_CONNECTION" ]; then
        ZSH_TMUX_AUTOSTART=false
    fi
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

if [ -f $HOME/.pyenv/shims/poetry ]; then
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
# alias bat="bat --theme=Monokai\ Extended\ Light"

# Automatically list directory contents on `cd`.
auto-ls () {
  if [ $HOME != "$(pwd)" ] && [ $LS_ON_CD = true ]; then 
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

dsf() {
    if [ "$#" -eq 2 ]; then
        git diff --no-index --color "$@" | diff-so-fancy | less -RFXx2
    fi
}
dsf $@

function rg {
    local tempfile="/tmp/pwd-from-ranger"
    ranger --choosedir=$tempfile $argv
    local rangerpwd=$(cat $tempfile)
    if [[ "$PWD" != $rangerpwd ]]; then
        cd $rangerpwd
    fi
}

function update_toolchain() {
    LS_ON_CD=false

    echo "Updating brew..."
    brew update
    brew upgrade
    brew cask upgrade

    echo "\nUpdating oh my zsh..."
    upgrade_oh_my_zsh
    
    (echo "\nUpdating pure..."
    cd ~/.oh-my-zsh/custom/plugins/pure
    git pull origin master)
    
    (echo "\nUpdating zsh-autosuggestions..."
    cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git pull origin master)
    
    (echo "\nUpdating zsh-syntax-highlighting..."
    cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git pull origin master)

    (echo "\nUpdating tpm..."
    cd  ~/.tmux/plugins/tpm
    git pull origin master)

    LS_ON_CD=true
}

