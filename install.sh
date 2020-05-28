#!/usr/bin/env bash

git clone https://github.com/dobrovolsky/dotfiles
cd dotfiles

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# ==================================
# APP INSTALL
# ==================================
cat brew.list | xargs brew install 
cat cask.list | xargs brew cask install 

# ==================================
# SHELL SETTINGS
# ==================================

# install oh my zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# make zsh default shell
sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

# key bindings for fzf
$(brew --prefix)/opt/fzf/install --all

# create symlinks
ln -sfv ${PWD}/.zshrc $HOME
ln -sfv ${PWD}/.gitignore $HOME
ln -sfv ${PWD}/.gitconfig $HOME
ln -sfv ${PWD}/.vimrc $HOME
ln -sfv ${PWD}/.tmux.conf $HOME
ln -sfv ${PWD}/.ideavimrc $HOME
# VSCode
rm -rf ~/Library/Application\ Support/VSCodium/User
mkdir  ~/Library/Application\ Support/VSCodium/User
ln -sfv ${PWD}/vscode/User/* ~/Library/Application\ Support/VSCodium/User/

# isntall pure
git clone https://github.com/sindresorhus/pure ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pure
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pure/async.zsh" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pure/async"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pure/pure.zsh" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pure/prompt_pure_setup"

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
PYTHON_VERSION=3.8.2
pyenv install "${PYTHON_VERSION}"
pyenv global "${PYTHON_VERSION}"
~/.pyenv/versions/"${PYTHON_VERSION}"/bin/pip install ipython

# add litecli
~/.pyenv/versions/"${PYTHON_VERSION}"/bin/pip install litecli

# add poetry
~/.pyenv/versions/"${PYTHON_VERSION}"/bin/pip install poetry
mkdir ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/poetry
~/.pyenv/shims/poetry completions zsh > ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/poetry/_poetry
~/.pyenv/shims/poetry config settings.virtualenvs.in-project true

# ==================================
# NODEJS
# ==================================
NODE_VERSION=14.1.0
nodenv install "${NODE_VERSION}"
nodenv global "${NODE_VERSION}"

# add httpstat
go get github.com/davecheney/httpstat

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# https://github.com/robbyrussell/oh-my-zsh/issues/7308#issuecomment-481255255
rm ~/.zcompdump*

# install from src
(
cd src
go build -o ../bin/es es.go
go build -o ../bin/fs fs.go
)

