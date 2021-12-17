# Navigation
alias ..="cd .."

# Shortcuts
alias c="clear"
alias g="git"
alias ga="git add ."
alias gc="git commit"
alias gp="git push original "

LAST_GOLANG_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/golang/go.git | grep "go" | grep -v "rc" | grep -v "beta" | tail -n1 | sed "s/.*\///")
PB_REL="https://github.com/protocolbuffers/protobuf/releases"
LAST_PROTOBUF_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/protocolbuffers/protobuf.git | tail -n1 | sed "s/.*\/v//")
OS="osx"
ARCH="x86_64"
PROTOC="protoc-$LAST_PROTOBUF_VERSION-$OS-$ARCH.zip"

alias update="
    sudo softwareupdate -i -a;

    go install golang.org/dl/$LAST_GOLANG_VERSION@latest;
    $LAST_GOLANG_VERSION download;

    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest;
    go install entgo.io/ent/cmd/ent@latest;
    go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest;

    curl -LO $PB_REL/download/v$LAST_PROTOBUF_VERSION/$PROTOC;
    unzip -o $PROTOC -d $HOME/.local;
    export PATH=$PATH:$HOME/.local/bin;
"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Get week number
alias week='date +%V'
