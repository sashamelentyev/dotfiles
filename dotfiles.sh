#!/usr/bin/env bash

dotfiles_repo_dir=$(pwd)
dotfiles_home_dir=(.aliases .editorconfig .functions .gitconfig .gitignore_global .zshrc)

usage() {
  local program_name
  program_name=${0##*/}
  cat <<EOF
Usage: $program_name [-option]
Options:
    --help
    -i     Install dotfiles
    -m     Install macOS settings
EOF
}

install_dotfiles() {
  for dotfile in "${dotfiles_home_dir[@]}"
  do
    env rm -rf "$HOME/${dotfile}"
    env ln -fs "$dotfiles_repo_dir/${dotfile}" "$HOME/"
  done
}

macOS() {
  # For Apple Silicon
  softwareupdate --install-rosetta --agree-to-license

  # XCode command-line tools
  xcode-select --install

  if ! [ -e /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew update

  brew install neovim
  brew install golangci-lint
}

main() {
  case "$1" in
    ''|-h|--help)
      usage
      exit 0
      ;;
    -i)
      install_dotfiles
      ;;
    ''|-m|--macos)
      macOS
      ;;
    *)
      echo "Command not found" >&2
      exit 1
  esac
}

main "$@"
