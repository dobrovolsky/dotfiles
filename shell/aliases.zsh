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