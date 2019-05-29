#!/usr/bin/env bash

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# ==================================
# APP INSTALL
# ==================================
brew install git
brew install httpie
brew install pgcli
brew install awscli
brew install htop
brew install pyenv
brew install pipenv
brew install fzf
brew install golang
brew install opencv
brew install tmux
brew install ctop
brew install exa
brew install bat
brew install diff-so-fancy
brew install docker-clean
brew install ranger
brew install youtube-dl
brew install tig
brew cask install java
brew cask install google-chrome
brew cask install iina
brew cask install iterm2
brew cask install telegram
brew cask install pycharm
brew cask install transmission

# ==================================
# SHELL SETTINGS
# ==================================

# install oh my zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# make zsh default shell
sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

# key bindings for fzf
$(brew --prefix)/opt/fzf/install

# create symlinks
ln -sfv ${PWD}/.zshrc $HOME
ln -sfv ${PWD}/.gitignore $HOME
ln -sfv ${PWD}/.gitconfig $HOME
ln -sfv ${PWD}/.vimrc $HOME
ln -sfv ${PWD}/.tmux.conf $HOME

# apply themes
ln -sv ${PWD}/xxf.zsh-theme  $ZSH_CUSTOM/themes/xxf.zsh-theme

# install spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ==================================
# MAC OS
# ==================================

# set computer's name
scutil --set ComputerName 'Mac'
scutil --set HostName 'Mac'
scutil --set LocalHostName 'mac'

# disable  hibernation
pmset -a hibernatemode 0

# ==================================
# PYTHON
# ==================================
pyenv install 3.7.3
pyenv global 3.7.3
pip install ipython

# add litecli
pip install litecli

# add poetry
pip install poetry
mkdir ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/poetry
poetry completions zsh > .oh-my-zsh/custom/plugins/poetry/_poetry

# add httpstat
go get github.com/davecheney/httpstat

