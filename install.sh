#!/usr/bin/env bash

configure_zsh() {
  echo "Configure zsh."

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
  configure_zsh
  configure_git
}

main "$@"
