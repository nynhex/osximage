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
	deluge
	disk-inventory-x
	google-chrome
	google-cloud-sdk
	iterm2
	keepassx
	keybase
	lastpass
	little-snitch
	sketch
	slack
	spotify
	sublime-text
	torbrowser
	vlc
	xscreensaver
"

for CASK in $CASKS ; do
    brew cask install $CASK
done
