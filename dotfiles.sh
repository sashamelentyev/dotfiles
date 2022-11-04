#!/usr/bin/env bash

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

install_dotfiles() {
  dotfiles_repo_dir=$(pwd)
  dotfiles_home_dir=(.aliases .editorconfig .functions .gitconfig .gitignore_global .zshrc)

  for dotfile in "${dotfiles_home_dir[@]}"
  do
    env rm -rf "$HOME/${dotfile}"
    env ln -fs "$dotfiles_repo_dir/${dotfile}" "$HOME/"
  done
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
    *)
      echo "Command not found" >&2
      exit 1
  esac
}

main "$@"
