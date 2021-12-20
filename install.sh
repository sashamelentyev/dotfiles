#!/usr/bin/env sh

MACHINE="UNKNOWN"

case "$(uname -s)" in
  Linux*)
    MACHINE=Linux
    ;;
  Darwin*)
    MACHINE=Mac
    ;;
esac

case $MACHINE in
  Mac*)
    # For Apple Silicon
    softwareupdate --install-rosetta --agree-to-license

    xcode-select --install

    if ! [ -e /opt/homebrew/bin/brew ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      echo "Homebrew already installed"
    fi

    if ! [ -e ~/.oh-my-zsh ]; then
      curl -Lo ohmyzsh.sh https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh;
      sed -i "" "/exec zsh -l/d" ohmyzsh.sh
      sh ohmyzsh.sh
      rm -rf ohmyzsh.sh
    else
      echo "Oh My Zsh already installed"
    fi

    rm -rf ~/.zshrc
    ln -s "$PWD"/.zshrc ~/.zshrc

    rm -rf ~/.gitconfig
    ln -s "$PWD"/.gitconfig ~/.gitconfig

    rm -rf ~/.gitignore_global
    ln -s "$PWD"/.gitignore_global ~/.gitignore_global
    ;;
esac
