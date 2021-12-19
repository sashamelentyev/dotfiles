#!/usr/bin/env bash

install_oh_my_zsh() {
  echo "Install Oh My Zsh."

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

configure_oh_my_zsh() {
  echo "Configure Oh My Zsh."

  rm -rf ~/.zshrc

  ln -s "$PWD"/.zshrc ~/.zshrc
}

configure_git() {
  echo "Configure git."

  rm -rf ~/.gitconfig
  rm -rf ~/.gitignore_global

  ln -s "$PWD"/.gitconfig ~/.gitconfig
  ln -s "$PWD"/.gitignore_global ~/.gitignore_global
}

main() {
  install_oh_my_zsh
  configure_oh_my_zsh
  configure_git
}

main
