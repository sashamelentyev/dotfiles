#!/usr/bin/env sh

sudo apt update && sudo apt upgrade -y

export LC_CTYPE=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8

sudo locale-gen UTF-8

sudo apt install curl -y

CORE=$(uname -s | tr '[:upper:]' '[:lower:]')

GOLANG_ARCHIVE_NAME="$(curl https://go.dev/VERSION?m=text).$CORE-amd64.tar.gz"

wget "https://dl.google.com/go/$GOLANG_ARCHIVE_NAME"
rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "$GOLANG_ARCHIVE_NAME"
export PATH=$PATH:/usr/local/go/bin
rm -rf "$GOLANG_ARCHIVE_NAME"
