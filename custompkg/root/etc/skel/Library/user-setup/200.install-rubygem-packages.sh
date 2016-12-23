#!/bin/bash

# set up paths and whatnot
source $HOME/.profile

RUBYGEM_PKGS="
    bundler
    overcommit
"

for PKG in $RUBYGEM_PKGS ; do
    gem install $PKG
done
