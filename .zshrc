alias ..="cd .."

LAST_GOLANG_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/golang/go.git | grep "go" | grep -v "rc" | grep -v "beta" | tail -n1 | sed "s/.*\///")
PB_REL="https://github.com/protocolbuffers/protobuf/releases"
LAST_PROTOBUF_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/protocolbuffers/protobuf.git | tail -n1 | sed "s/.*\/v//")
OS="osx"
ARCH="x86_64"
PROTOC="protoc-$LAST_PROTOBUF_VERSION-$OS-$ARCH.zip"

alias update="
    go install golang.org/dl/$LAST_GOLANG_VERSION@latest;
    $LAST_GOLANG_VERSION download;
    sudo go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest;
    curl -LO $PB_REL/download/v$LAST_PROTOBUF_VERSION/$PROTOC;
    unzip $PROTOC -d $HOME/.local;
    export PATH=$PATH:$HOME/.local/bin;
"
