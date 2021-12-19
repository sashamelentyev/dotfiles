#!/usr/bin/env sh

echo "Configuring git..."

rm -rf ~/.gitconfig
rm -rf ~/.gitignore_global

ln -s "$PWD"/.gitconfig ~/.gitconfig
ln -s "$PWD"/.gitignore_global ~/.gitignore_global

echo "Configuring zsh..."

rm -rf ~/.zshrc

ln -s "$PWD"/.zshrc ~/.zshrc
