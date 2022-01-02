#!/bin/zsh

# For Apple Silicon
softwareupdate --install-rosetta --agree-to-license

# XCode command-line tools
xcode-select --install

if ! [ -e /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update --verbose

brew install neovim
brew install golang
brew install --cask telegram

scutil --set HostName "localhost"

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-process-indicators -bool true

killall Dock

defaults write com.apple.Finder AppleShowAllFiles -bool true
