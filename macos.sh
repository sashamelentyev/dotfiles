#!/bin/zsh

if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

if ! [ -e ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_rsa" -C "sasha@melentyev.io"
fi

# For Apple Silicon
softwareupdate --install-rosetta --agree-to-license

# XCode command-line tools
xcode-select --install

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update --verbose

brew install neovim
brew install golang
brew install --cask telegram
brew install --cask slack
brew install tmux
brew install zoom

scutil --set HostName "localhost"

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-process-indicators -bool true

killall Dock

defaults write com.apple.Finder AppleShowAllFiles -bool true
