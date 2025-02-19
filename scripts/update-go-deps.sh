#!/bin/zsh

set -eou pipefail

go get $(go list -f '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}' -m all)
go mod tidy
