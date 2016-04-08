# go-vendoring

With a single-value `$GOPATH`, e.g. `/path/to/gopath`:

```sh
go get github.com/myitcv/go-vendoring/cmd/a      // ok
cd $GOPATH/src/github.com/myitcv/go-vendoring
go test ./...                                    // ok
export GOPATH=$PWD/_vendor:$GOPATH
go test ./...                                    // fails
```
