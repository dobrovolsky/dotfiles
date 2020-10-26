source ~/.dotfiles/nvim/config.vim
source ~/.dotfiles/nvim/mapping.vim

" don't load plugings for vscode
if exists('g:vscode')
    source ~/.dotfiles/nvim/vscode.vim
else
    source ~/.dotfiles/nvim/plugings.vim
endif
