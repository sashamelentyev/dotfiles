#!/bin/sh

install_zsh() {
	echo "Installing .zshrc"
	rm -rf ~/.zshrc
	ln -s "$PWD"/.zshrc ~/.zshrc
}
