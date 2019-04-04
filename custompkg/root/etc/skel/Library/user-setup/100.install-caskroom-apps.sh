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
    1password
    1password-cli
    ableton-live-suite
    anki
    atom
    dashlane
    deluge
    disk-inventory-x
    expandrive
    google-chrome
    google-cloud-sdk
    handbrake
    iterm2
    keepassx
    keybase
    lastpass
    little-snitch
    minikube
    openscad
    sketch
    slack
    spotify
    sublime-text
    syncthing-app
    tor-browser
    vcv-rack
    vlc
    xscreensaver
"

for CASK in $CASKS ; do
    brew cask install $CASK
done

brew tap caskroom/fonts

FONTS="
    font-anonymice-powerline
    font-consolas-for-powerline
    font-dejavu-sans-mono-for-powerline
    font-droid-sans-mono-for-powerline
    font-fira-mono-for-powerline
    font-inconsolata-dz-for-powerline
    font-inconsolata-for-powerline
    font-inconsolata-g-for-powerline
    font-liberation-mono-for-powerline
    font-menlo-for-powerline
    font-meslo-for-powerline
    font-monofur-for-powerline
    font-noto-mono-for-powerline
    font-roboto-mono-for-powerline
    font-source-code-pro-for-powerline
    font-ubuntu-mono-derivative-powerline
"

for FONT in $FONTS ; do
    brew cask install $FONT
done
