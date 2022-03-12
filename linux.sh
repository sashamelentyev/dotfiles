#!/usr/bin/env sh

if [ "$(uname -s)" != "Linux" ]; then
  exit 0
fi

sudo apt update
sudo apt upgrade

sudo apt install snapd

sudo snap install nvim --classic
sudo snap install go --classic
sudo snap install tmux --classic
