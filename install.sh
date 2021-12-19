#!/usr/bin/env sh

msg() {
  echo "-- $*"
}

install_oh_my_zsh() {
  msg "Install Oh My ZSH."

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

configure_oh_my_zsh() {
  msg "Configure zsh."

  rm -rf ~/.zshrc

  ln -s "$PWD"/.zshrc ~/.zshrc
}

configure_git() {
  msg "Configure git."

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

main "$@"
