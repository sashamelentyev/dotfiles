#!/bin/bash

last_go_version=$(curl -s https://go.dev/VERSION?m=text)
go install golang.org/dl/"${last_go_version}"@latest
