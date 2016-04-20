#!/usr/bin/env bash

set -ex

cd `mktemp -d /tmp/go-test-repo-XXXXX`
export GOPATH=$PWD
mkdir -p $GOPATH/src/github.com/myitcv/go-vendoring
git clone https://github.com/myitcv/go-vendoring.git $GOPATH/src/github.com/myitcv/go-vendoring
cd $GOPATH/src/github.com/myitcv/go-vendoring
git checkout origin/branch-1
go install github.com/myitcv/go-vendoring/cmd/a
$GOPATH/bin/a
export GOPATH=$GOPATH/src/github.com/myitcv/go-vendoring/_vendor:$GOPATH
go test ./...
