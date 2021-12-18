#!/bin/sh

git() {
	echo "Installing .gitconfig"
	rm -rf ~/.gitconfig
	ln -s "$PWD"/.gitconfig ~/.gitconfig
}

zsh() {
	echo "Installing .zshrc"
	rm -rf ~/.zshrc
	ln -s "$PWD"/.zshrc ~/.zshrc
}
