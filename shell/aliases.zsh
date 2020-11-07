# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

if command -v "exa"  > /dev/null 2>&1 ; then
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

alias vim="nvim"
alias v="nvim"

alias y="youtube-dl"

alias c="bat"

# GIT
alias g='git'
alias ga='git add'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gpull='git pull origin "$(git_current_branch)"'
alias gpush='git push origin "$(git_current_branch)"'
alias gl='git pull'
alias glg='git log --stat'
alias gp='git push'
alias grb='git rebase'
alias gst='git status'
alias gsta='git stash'
alias gstaa='git stash apply'
alias gstal='git stash list'
alias gstau='git stash --include-untracked'
