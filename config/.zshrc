# don't start tmux in ide and ssh terminals
if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ] || 
   [ "$TERMINAL_EMULATOR" = "VSCODE" ] || 
   [ -n "$SSH_CONNECTION" ]; then
    ZSH_TMUX_AUTOSTART=false
else 
    ZSH_TMUX_AUTOSTART=true
fi

# allow JetBrains' IDEAs to access history
HISTFILE=~/.zsh_history

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32

#  print what list of files for navigated directory
chpwd_functions=( $chpwd_functions auto-ls)

source "$HOME/.config/dotfiles/shell/exports.zsh"
source "$HOME/.config/dotfiles/shell/plugins.zsh"
source "$HOME/.config/dotfiles/shell/aliases.zsh"
source "$HOME/.config/dotfiles/shell/functions.zsh"
source "$HOME/.config/dotfiles/shell/fzf.zsh"

# show stash icon
zstyle :prompt:pure:git:stash show yes 
