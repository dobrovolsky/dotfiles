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
pip install pipenv
pip install youtube-dl
pip install ranger

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

# install pure
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

cd ~/
mkdir programs

# install Pychram
wget https://download.jetbrains.com/python/pycharm-professional-2019.2.1.tar.gz
tar -C programs -xzf pycharm-professional-2019.2.1.tar.gz
rm pycharm-professional-2019.2.1.tar.gz

# install Goland
wget https://download.jetbrains.com/go/goland-2019.2.1.tar.gz
tar -C programs -xzf goland-2019.2.1.tar.gz
rm goland-2019.2.1.tar.gz

# install VSComdium
wget https://github.com/VSCodium/vscodium/releases/download/1.37.1/codium_1.37.1-1565952268_amd64.deb
sudo dpkg -i codium_1.37.1-1565952268_amd64.deb
rm codium_1.37.1-1565952268_amd64.deb
rm -rf ~/.config/VSCodium/User
mkdir ~/.config/VSCodium/User
ln -sfv ${PWD}/vscode/User/* ~/.config/VSCodium/User
sudo apt install fonts-firacode

# install telegram
wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
telegram-desktop

# install golang
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go -y

# install spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# install ctop
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

# install httpstat
go get github.com/davecheney/httpstat

# install docker-clean
curl -s https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean |
    sudo tee /usr/local/bin/docker-clean > /dev/null && \
    sudo chmod +x /usr/local/bin/docker-clean

# install tig
sudo apt install tig -y

# install xclip
sudo apt install xclip -y
