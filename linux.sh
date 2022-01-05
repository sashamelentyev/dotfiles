#!/usr/bin/env sh

sudo apt update
sudo apt upgrade

sudo apt install snapd

sudo snap install nvim --classic
sudo snap install go --classic
sudo snap install telegram-desktop
sudo snap install slack --classic
sudo snap install tmux --classic
