source $HOME/.dotfiles/deps/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle gitfast
antigen bundle colored-man-pages
antigen bundle extract
antigen bundle tmux
antigen bundle golang
antigen bundle docker
antigen bundle docker-compose
antigen bundle httpie
antigen bundle vi-mode

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle MichaelAquilina/zsh-auto-notify
antigen bundle changyuheng/fz
antigen bundle rupa/z
antigen bundle sobolevn/wakatime-zsh-plugin

antigen bundle --loc=~/dotfiles/python/_poetry

antigen apply
