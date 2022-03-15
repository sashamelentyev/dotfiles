#!/usr/bin/env sh

case "$(uname -s)" in
Linux*)
  sh ./linux.sh
  ;;
Darwin*)
  sh ./macos.sh
  ;;
esac

if ! [ -e ~/.oh-my-zsh ]; then
  curl -Lo ohmyzsh.sh https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sed -i "" "/exec zsh -l/d" ohmyzsh.sh
  sh ohmyzsh.sh
  rm -rf ohmyzsh.sh
fi

rm -rf ~/.zshrc
ln -s "$PWD"/.zshrc ~/.zshrc

rm -rf ~/.gitconfig
ln -s "$PWD"/.gitconfig ~/.gitconfig

rm -rf ~/.gitignore_global
ln -s "$PWD"/.gitignore_global ~/.gitignore_global

rm -rf ~/.editorconfig
ln -s "$PWD"/.editorconfig ~/.editorconfig

rm -rf ~/.config/nvim
ln -s "$PWD"/nvim ~/.config

sudo go install golang.org/x/tools/...@latest
sudo go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install entgo.io/ent/cmd/ent@latest
go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest
go install github.com/bufbuild/buf/cmd/buf@latest
go install github.com/go-dummy/dummy/cmd/dummy@latest
sudo go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/thepudds/fzgen/cmd/fzgen@latest
