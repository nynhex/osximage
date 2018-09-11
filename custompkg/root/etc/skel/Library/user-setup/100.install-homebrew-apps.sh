#!/bin/bash

# set up paths and whatnot
source $HOME/.profile

HOMEBREW_PKGS="
	autoconf
	automake
	bash-completion
	bash-git-prompt
	bonnie++
	byobu
	cmake
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
	ghc
	gist
	git
	gnupg
	gnupg2
	go
	gpg-agent
	graphviz
	httpie
	homebrew/dupes/rsync
	irssi
	jq
	kubernetes-cli
	lame
	mosh
	mtr
	mutt
	nmap
	node
	pbzip2
	pgpdump
	pinentry-mac
	protobuf
	pv
	pwgen
	python3
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
    corelocationcli
    heroku
    offlineimap
    postgres
"

for PKG in $HOMEBREW_PKGS ; do
    brew install $PKG
done
