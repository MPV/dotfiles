#!/usr/bin/env bash

# Based on: https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
#brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
#brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
#brew install gnu-sed --with-default-names

# Install GnuPG to enable PGP-signing commits (and installing NodeJS).
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install wget
brew install curl
brew install git
brew install git-lfs
brew install ack
brew install tree

# JSON tooling:
brew install jid
brew install jq

brew install asdf	# Dependency manager ASDF
brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl
# ...for installing asdf plugins

brew install zsh
brew install antigen	# ZSH plugin manager
brew install starship

# Remove outdated versions from the cellar.
brew cleanup
