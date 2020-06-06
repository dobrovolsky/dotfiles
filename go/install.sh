#!/usr/bin/env bash

# add httpstat
go get github.com/davecheney/httpstat

# install from src
(
    cd ~/dotfiles/src
    go build -o ~/.config/dotfiles/.bin/es es.go
    go build -o ~/.config/dotfiles/.bin/fs fs.go
)