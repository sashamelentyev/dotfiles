#!/bin/zsh

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-process-indicators -bool true

killall Dock
