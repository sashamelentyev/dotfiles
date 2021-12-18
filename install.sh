#!/bin/sh

git() {
	echo "Installing .gitconfig"

	rm -rf ~/.gitconfig
	rm -rf ~/.gitignore_global

	ln -s "$PWD"/.gitconfig ~/.gitconfig
	ln -s "$PWD"/.gitignore_global ~/.gitignore_global
}

zsh() {
	echo "Installing .zshrc"

	rm -rf ~/.zshrc

	ln -s "$PWD"/.zshrc ~/.zshrc
}
