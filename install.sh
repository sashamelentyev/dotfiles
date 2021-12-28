#!/usr/bin/env sh

MACHINE="Unknown"

case "$(uname -s)" in
  Linux*)
    MACHINE=Linux
    ;;
  Darwin*)
    MACHINE=Mac
    ;;
esac

case $MACHINE in
  Linux*)
    ;;
  Mac*)
    sh ./macos.sh

    if ! [ -e ~/.oh-my-zsh ]; then
      curl -Lo ohmyzsh.sh https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh;
      sed -i "" "/exec zsh -l/d" ohmyzsh.sh
      sh ohmyzsh.sh
      rm -rf ohmyzsh.sh
    else
      echo "Oh My Zsh already installed"
    fi

    echo "Configure zsh"
    rm -rf ~/.zshrc
    ln -s "$PWD"/.zshrc ~/.zshrc

    rm -rf ~/.gitconfig
    ln -s "$PWD"/.gitconfig ~/.gitconfig

    rm -rf ~/.gitignore_global
    ln -s "$PWD"/.gitignore_global ~/.gitignore_global

    rm -rf ~/.editorconfig
    ln -s "$PWD"/.editorconfig ~/.editorconfig

    if ! [ -e "$HOME"/nvim-osx64/bin ]; then
      NVIM="nvim-macos.tar.gz"

      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz;
      tar xzf "$NVIM" --directory "$HOME";
      rm -rf "$NVIM";
    else
      echo "Neovim already installed"
    fi
    ;;
esac

go install golang.org/x/tools/...@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install entgo.io/ent/cmd/ent@latest
go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest
go install github.com/bufbuild/buf/cmd/buf@latest
