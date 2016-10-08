#!/bin/bash


# set up paths and whatnot
source $HOME/.profile

# per default settings apps are installed in homedir
if [[ ! -d ~/Applications ]]; then
    mkdir -p ~/Applications
fi

# install caskroom
brew tap caskroom/cask

CASKS="
	atom
	disk-inventory-x
	github-desktop
	google-chrome
	google-drive
	iterm2
	keepassx
	lastpass
	slack
	spotify
	sublime-text
	xscreensaver
"

for CASK in $CASKS ; do
    brew cask install $CASK
done
