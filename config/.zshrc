export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/dotfiles/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh

export BAT_CONFIG_PATH=$HOME/dotfiles/bat.conf

# allow JetBrains' IDEAs to access history
HISTFILE=~/.zsh_history

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

source ~/dotfiles/antigen/antigen.zsh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle gitfast
antigen bundle kubectl
antigen bundle colored-man-pages
antigen bundle extract
antigen bundle zsh-interactive-cd

if command_exists tmux ; then
  antigen bundle tmux
  ZSH_TMUX_AUTOSTART=true

  JB="JetBrains-JediTerm"
  VC="VSCODE"
    
  if [ "$TERMINAL_EMULATOR" = "$JB" ] || [ "$TERMINAL_EMULATOR" = "$VC" ] || [ -n "$SSH_CONNECTION" ]; then
      ZSH_TMUX_AUTOSTART=false
  fi
fi

if command_exists pyenv ; then
  antigen bundle pyenv
fi

if command_exists go ; then
  antigen bundle golang

  # Add go liblary to path
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

if command_exists docker ; then
  antigen bundle docker
  antigen bundle docker-compose
fi

if command_exists http ; then
  antigen bundle httpie
fi

if [ -f $HOME/.pyenv/shims/poetry ]; then
  antigen bundle --loc=~/dotfiles/python/_poetry
fi

antigen apply

# show stash icon
zstyle :prompt:pure:git:stash show yes 

# set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Setup FZF
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

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
# make notes
alias n="open 'notion://www.notion.so/e398ce19ebc8457c8bbd8187cc9f46e4?v=75cddc846deb4e449e5cb91e8bb6470b'"
# check weather
alias weather="curl 'wttr.in/Kiev?2Q'"
# usually useful in some dialogs ¯\_(ツ)_/¯
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Automatically list directory contents on `cd`.
auto-ls () {
  if [ $HOME != "$(pwd)" ] && [ $LS_ON_CD = true ]; then 
    # ll doen't exists, should call in this way :( 
	  eval "ll"
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

# use diff-so-fancy for comparing 2 files
dsf() {
    if [ "$#" -eq 2 ]; then
        git diff --no-index --color "$@" | diff-so-fancy | less -RFXx2
    fi
}
dsf $@

# run ranger and change directory to last navigated on exit
function rg {
  local tempfile="/tmp/pwd-from-ranger"
  ranger --choosedir=$tempfile $argv
  local rangerpwd=$(cat $tempfile)
  if [[ "$PWD" != $rangerpwd ]]; then
      cd $rangerpwd
  fi
}

# update dependencies
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

# init nodenv
eval "$(nodenv init - zsh)"
