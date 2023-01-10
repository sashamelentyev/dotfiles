#!/bin/bash

set -eou pipefail

usage() {
  local program_name
  program_name=${0##*/}
  cat <<EOF
Usage: $program_name [-option]
Options:
    --help
    -i     Install dotfiles
EOF
}

install() {
  dotfiles_repo_dir=$(pwd)
  dotfiles_home_dir=(.gitconfig .gitignore_global .zshrc)

  for dotfile in "${dotfiles_home_dir[@]}"
  do
    env rm -rf "$HOME/${dotfile}"
    env ln -fs "$dotfiles_repo_dir/${dotfile}" "$HOME/"
  done
  
  env ln -fs "$dotfiles_repo_dir/.config/nvim/init.lua" "$HOME/.config/nvim/init.lua"
}

main() {
  case "$1" in
    ''|-h|--help)
      usage
      exit 0
      ;;
    -i)
      install
      ;;
    *)
      echo "Command not found" >&2
      exit 1
  esac
}

main "$@"
