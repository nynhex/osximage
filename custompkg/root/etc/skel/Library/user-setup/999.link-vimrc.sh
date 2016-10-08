#!/bin/bash
# look for vimrc in synceddir/Dotfiles
if [[ ! -e ~/.vimrc ]]; then
    ln -s ~/.paths/synceddir/Dotfiles/vimrc ~/.vimrc
fi
