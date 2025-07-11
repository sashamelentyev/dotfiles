#!/bin/zsh

set -eou pipefail

usage() {
  local program_name
  program_name=${0##*/}
  cat <<EOF
Usage: $program_name [-h, --help]
Commands:
    install    Install dotfiles
EOF
}

install() {
  dotfiles_repo_dir=$(pwd)
  dotfiles_home_dir=(.gitconfig .gitconfig-github .gitconfig-ncloudtech .gitignore-global .gitconfig-sourcecraft .zshrc .config)

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
    install)
      install
      ;;
    *)
      echo "Command not found" >&2
      exit 1
  esac
}

main "$@"
