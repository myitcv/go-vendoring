# go-vendoring

With a single-value `$GOPATH`, e.g. `/path/to/gopath`:

```sh
$ go version
go version go1.6 linux/amd64
$ go get github.com/myitcv/go-vendoring/{cmd/a,mylib1,mylib2}   # ok
$ $GOPATH/bin/a
07cbb7e2-8975-44a9-9937-92d9dddae612                            # a uuid is output
$ cd $GOPATH/src/github.com/myitcv/go-vendoring
$ go test ./...                                                 # ok
?       github.com/myitcv/go-vendoring/cmd/a    [no test files]
?       github.com/myitcv/go-vendoring/mylib1   [no test files]
?       github.com/myitcv/go-vendoring/mylib2   [no test files]
$ export GOPATH=$PWD/_vendor:$GOPATH
$ go test ./...                                                 # fails
$ go test ./...
panic: runtime error: slice bounds out of range

goroutine 1 [running]:
panic(0x93c000, 0xc82000e120)
        /usr/local/go/src/runtime/panic.go:464 +0x3e6
main.vendoredImportPath(0xc82030f000, 0xc8202c67c1, 0x17, 0x0, 0x0)
        /usr/local/go/src/cmd/go/pkg.go:460 +0x67b
main.loadImport(0xc8202c67c1, 0x17, 0xc820193b90, 0x69, 0xc82030f000, 0xc8201e71c8, 0xc8202c5050, 0x1, 0x1, 0x1, ...)
        /usr/local/go/src/cmd/go/pkg.go:336 +0xe52
main.(*Package).load(0xc82030f000, 0xc8201e71c8, 0xc8201c7500, 0x0, 0x0, 0x4)
        /usr/local/go/src/cmd/go/pkg.go:947 +0x4397
main.loadImport(0xc8201d62d1, 0x25, 0xc8201a5d40, 0x3c, 0xc8201d4000, 0xc8201e71c8, 0xc8201d6390, 0x1, 0x1, 0x1, ...)
        /usr/local/go/src/cmd/go/pkg.go:377 +0x84e
main.(*Package).load(0xc8201d4000, 0xc8201e71c8, 0xc8201c6700, 0x0, 0x0, 0xc)
        /usr/local/go/src/cmd/go/pkg.go:947 +0x4397
main.loadImport(0xc82019ab70, 0x7, 0xc820016044, 0x36, 0x0, 0xc8201e71c8, 0x0, 0x0, 0x0, 0x0, ...)
        /usr/local/go/src/cmd/go/pkg.go:377 +0x84e
main.loadPackage(0xc82019ab70, 0x7, 0xc8201e71c8, 0x0)
        /usr/local/go/src/cmd/go/pkg.go:1633 +0x13d8
main.packagesAndErrors(0xc820181890, 0x3, 0x3, 0x0, 0x0, 0x0)
        /usr/local/go/src/cmd/go/pkg.go:1678 +0x531
main.packagesForBuild(0xc82019a5e0, 0x1, 0x1, 0x0, 0x0, 0x0)
        /usr/local/go/src/cmd/go/pkg.go:1694 +0x82
main.runTest(0xc887e0, 0xc8200781d0, 0x1, 0x1)
        /usr/local/go/src/cmd/go/test.go:375 +0x14e
main.main()
        /usr/local/go/src/cmd/go/main.go:181 +0x783
```
