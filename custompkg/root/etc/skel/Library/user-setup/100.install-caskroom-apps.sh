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
	github-desktop
	google-chrome
	google-drive
	iterm2
	keepassx
	lastpass
	little-snitch
	slack
	spotify
	sublime-text
	torbrowser
	vlc
	xscreensaver
	xquartz
"

for CASK in $CASKS ; do
    brew cask install $CASK
done
