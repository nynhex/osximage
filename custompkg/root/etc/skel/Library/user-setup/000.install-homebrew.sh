#!/bin/bash
############################################# install homebrew under homedir
if [[ ! -d ~/Library/Homebrew ]]; then
    mkdir -p ~/Library/Homebrew
    cd ~/Library/Homebrew
    curl -fsSL https://github.com/Homebrew/brew/tarball/master | \
        tar --strip-components 1 -xvf -
fi
