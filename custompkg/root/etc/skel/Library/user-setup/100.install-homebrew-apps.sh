#!/bin/bash

# set up paths and whatnot
source $HOME/.profile

HOMEBREW_PKGS="
    asciinema
    autoconf
    automake
    bash-completion
    bash-git-prompt
    bonnie++
    byobu
    cmake
    corelocationcli
    coreutils
    curl
    daemontools
    docker
    docker-compose
    docker-machine
    duplicity
    ffmpeg
    fish
    flac
    geoip
    gist
    git
    gnupg
    gnupg2
    go
    gpg-agent
    graphviz
    heroku
    homebrew/dupes/rsync
    httpie
    irssi
    jq
    kubernetes-cli
    lame
    mosh
    mtr
    mutt
    nmap
    node
    offlineimap
    par2
    pbzip2
    pgpdump
    pinentry-mac
    postgres
    protobuf
    pv
    pwgen
    python3
    rust
    socat
    sox
    speedtest_cli
    syncthing
    tcptraceroute
    terraform
    tor
    torsocks
    unrar
    unzip
    vimpager
    watch
    wget
    whatmask
"

for PKG in $HOMEBREW_PKGS ; do
    brew install $PKG
done
