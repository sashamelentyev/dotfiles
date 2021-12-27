#!/bin/zsh

scutil --set HostName "localhost"

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-process-indicators -bool true

killall Dock

defaults write com.apple.Finder AppleShowAllFiles -bool true
