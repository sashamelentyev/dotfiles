export PATH="$PATH":"$HOME"/.local/bin;
export PATH="$PATH":"$HOME"/nvim-osx64/bin;

plugins=(
   git
   golang
)

ZSH_THEME=agnoster

source ${HOME}/.oh-my-zsh/oh-my-zsh.sh

# Navigation
alias ..="cd .."

# Shortcuts
alias c="clear"
alias p="cd ~/Projects"

# Always use color output for `ls`
alias ls="command ls --color"

# VIM
export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"

# git commit -a -m type(package): message
# Type must be one of the following:
# build: Changes that affect the build system or external dependencies
# ci: Changes to our CI configuration files and scripts
# docs: Documentation only changes
# feat: A new feature
# fix: A bug fix
# perf: A code change that improves performance
# refactor: A code change that neither fixes a bug nor adds a feature
# style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
# test: Adding missing tests or correcting existing tests
gcamt(){
  MESSAGE="($2): ${@:3}"
  gcam "$1$MESSAGE"
}

lint(){
  case $1 in
    go)
      golangci-lint run
      ;;
    yaml)
      yamllint $2
      ;;
    *)
      echo ""
      ;;
  esac
}

update(){
  LAST_GOLANG_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/golang/go.git | grep "go" | grep -v "rc" | grep -v "beta" | tail -n1 | sed "s/.*\///")

  go install golang.org/dl/"$LAST_GOLANG_VERSION"@latest;
  $LAST_GOLANG_VERSION download;

  sudo go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest;
  go install entgo.io/ent/cmd/ent@latest;
  go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest;

  PB_REL="https://github.com/protocolbuffers/protobuf/releases"
  LAST_PROTOBUF_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/protocolbuffers/protobuf.git | tail -n1 | sed "s/.*\/v//")
  OS="osx"
  ARCH="x86_64"
  PROTOC="protoc-$LAST_PROTOBUF_VERSION-$OS-$ARCH.zip"

  curl -LO $PB_REL/download/v"$LAST_PROTOBUF_VERSION"/"$PROTOC";
  unzip -o "$PROTOC" -d "$HOME"/.local;
  rm -rf "$PROTOC";
}

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Get week number
alias week='date +%V'

abc() {
  abc="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  if [ $# -eq 0 ]; then
    echo $abc
    return
  fi

  echo $abc | sed "s/.*$1//"
}

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
