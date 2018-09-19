#!/bin/bash


# set up paths and whatnot
source $HOME/.profile

# per default settings apps are installed in homedir
if [[ ! -d ~/Applications ]]; then
    mkdir -p ~/Applications
fi

# install caskroom
brew tap caskroom/cask

# no google-drive-file-stream because it requires admin privs and installs to /Applications systemwide
CASKS="
        anki
	atom
	dashlane
	1password
	1password-cli
	deluge
	disk-inventory-x
	expandrive
	google-chrome
	google-cloud-sdk
	iterm2
	keepassx
	keybase
	lastpass
	little-snitch
	minikube
	sketch
	slack
	spotify
	sublime-text
	syncthing-app
	torbrowser
	vlc
	xscreensaver
"

for CASK in $CASKS ; do
    brew cask install $CASK
done
