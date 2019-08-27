git clone https://github.com/dobrovolsky/dotfiles
cd dotfiles

sudo apt update

# install pyenv
curl https://pyenv.run | bash
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# https://github.com/pyenv/pyenv/wiki/common-build-problemsn/
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git -y

pyenv install 3.7.4
pyenv global 3.7.4

sudo apt install libpq-dev -y
pip install pgcli
pip install ipython
pip install awscli
pip install httpie
pip install litecli

# isntall poetry
pip install poetry
mkdir ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/poetry
poetry completions zsh > ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/poetry/_poetry
poetry config settings.virtualenvs.in-project true

sudo apt install tmux -y
sudo apt install zsh -y
sudo apt install vim -y
sudo apt install htop -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install exa
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
rm exa-linux-x86_64-0.9.0.zip

# install bat
wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb 
sudo dpkg -i bat_0.11.0_amd64.deb
rm bat_0.11.0_amd64.deb

# install diff-so-fancy
sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -O /usr/local/bin/diff-so-fancy
sudo +x /usr/local/bin/diff-so-fancy

# create symlinks
ln -sfv ${PWD}/.zshrc $HOME
ln -sfv ${PWD}/.gitignore $HOME
ln -sfv ${PWD}/.gitconfig $HOME
ln -sfv ${PWD}/.vimrc $HOME
ln -sfv ${PWD}/.tmux.conf $HOME

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

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

