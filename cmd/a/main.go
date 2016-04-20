package main

import (
	"fmt"

	"github.com/myitcv/go-vendoring/cmd/a/internal/cmdinternallib1"
	"github.com/myitcv/go-vendoring/mylib1"
)

func main() {
	fmt.Println(mylib1.DoSomething(), cmdinternallib1.DoSomething())
}
