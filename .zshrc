alias ..="cd .."

LAST_GOLANG_VERSION=$(git ls-remote --tags --sort="v:refname" git://github.com/golang/go.git | grep "go" | tail -n1 | sed "s/.*\///")

alias update="
    go install golang.org/dl/${LAST_GOLANG_VERSION}@latest;
    ${LAST_GOLANG_VERSION} download
"
