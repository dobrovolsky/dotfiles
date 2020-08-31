#!/usr/bin/env bash

# add httpstat
go get github.com/davecheney/httpstat
# add 2fa 
go get rsc.io/2fa

# install from src
(
    cd ~/dotfiles/src
    go build -o ~/.dotfiles/bin/es es.go
    go build -o ~/.dotfiles/bin/fs fs.go
)