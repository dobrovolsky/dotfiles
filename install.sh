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
brew cask install java
brew cask install google-chrome
brew cask install iina
brew cask install iterm2
brew cask install telegram
brew cask install pycharm
brew cask install transmission
brew cask install marshallofsound-google-play-music-player
brew cask install sublime-text


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

# apply theme
ln -sv ${PWD}/xxf.zsh-theme  $HOME/.oh-my-zsh/themes/xxf.zsh-theme

# install syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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
pyenv install 3.7.0
pyenv local 3.7.0
pip install ipython

# ==================================
# NODE
# ==================================
git clone https://github.com/lukechilds/zsh-nvm \
 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
nvm install --lts
