# Automatically list directory contents on `cd` except home.
auto-ls() {
if [ $HOME != "$(pwd)" ]; then
    ll
  fi
}

#  print what list of files for navigated directory
chpwd_functions=( $chpwd_functions auto-ls)

# Create a new directory and enter it
mk() {
  mkdir -p "$@" && cd "$@"
}

# Get length of string
len() {
  string=$@
  echo ${#string}
}

fzf-log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

fzf-log-preview() {
  _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

  git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@" |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "ctrl-y:execute:$_gitLogLineToHash | pbcopy"
}

# use diff-so-fancy for comparing 2 files
dsf() {
  if [ "$#" -eq 2 ]; then
        git diff --no-index --color "$@" | diff-so-fancy | less -RFXx2
  fi
}

# run ranger and change directory to last navigated on exit
rg() {
  local tempfile="/tmp/pwd-from-ranger"
  ranger --choosedir=$tempfile $argv
  local rangerpwd=$(cat $tempfile)
  if [[ "$PWD" != $rangerpwd ]]; then
      cd $rangerpwd
  fi
}

# get info who is using given port
port() {
  lsof -n -i ":$@" | grep LISTEN
}

# get 2fa code and copy to clipboard
2f() {
  2fa $(2fa -list | fzf ) | pbcopy
}

# load dark or light config for tmux
_load_theme() {
  if [ "$1" != "Dark" ]; then
  tmux source ~/.dotfiles/tmux/tmux-line-light.conf
  else
    tmux source ~/.dotfiles/tmux/tmux-line-dark.conf
  fi
}

# check if theme is changed
_theme_watcher() {
  theme=`defaults read -g AppleInterfaceStyle 2>/dev/null`
  _load_theme $theme

  while :
  do
    new_theme=`defaults read -g AppleInterfaceStyle 2>/dev/null`
    if [ "$theme" != "$new_theme" ]; then
      _load_theme $new_theme
      theme=$new_theme
    fi
    sleep 3
  done
}

# run async worker with theme watcher
if [ -n "$TMUX" ]; then
  async_start_worker theme_watcher_worker
  async_job theme_watcher_worker _theme_watcher
fi
