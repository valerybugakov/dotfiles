#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# More recent versions of some OS X tools
brew install screen
brew install grep

utils=(
	gnutls
	gawk
	binutils
	coreutils
	moreutils
	findutils
	m-cli
	shellcheck
)

brew install ${utils[@]}
# sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Subversions
subversions=(
	git
	git-extras
)

brew install ${subversions[@]}

# Extend global $PATH
echo -e "setenv PATH $HOME/dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" | sudo tee /etc/launchd.conf

# OS X crutches
crutches=(
	vim
	neovim

	the_silver_searcher
	ack
	fzf
	ripgrep

	gzip
	unzip

	bash
	shellcheck

	cmake
	ctags

	htop-osx
	wget
	curl
	ssh-copy-id

	openssl

	zplug
)

brew install ${crutches[@]}
$(brew --prefix)/opt/fzf/install

# Everything else
everythingelse=(
	thefuck
	mackup
)

brew install ${everythingelse[@]}

languages=(
	nodejs

	scala
	sbt

	erlang
	go
	rust
	racket

	postgresql
	redis
	# mongodb

	rbenv
)

brew install ${languages[@]}

# MongoDB
sudo mkdir -p /data/db

# Terminal multiplexer
brew install tmux
brew install reattach-to-user-namespace

# Frontend libs
brew install imagemagick
brew install watchman

# Node.js && npm
brew install nvm
mkdir "$HOME/.nvm"
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
nvm install --lts
nvm use --lts

# Remove outdated versions from the cellar
brew cleanup
