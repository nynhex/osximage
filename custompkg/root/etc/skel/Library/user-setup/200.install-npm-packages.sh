#!/bin/bash

# set up paths and whatnot
source $HOME/.profile

NPM_PKGS="
    coffee-script
    yarn
"

for PKG in $NPM_PKGS ; do
    # -g is okay because "global" prefix is where homebrew
    # installed npm, i.e. in ~/Library/Homebrew, not actually systemwide
    npm install -g $PKG
done
