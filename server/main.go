package main

import (
	"github.com/N1cOs/vkhack2019/server/grpc"
	"log"
)

func main() {
	const address = "0.0.0.0:8080"
	server := grpc.NewServer()
	if err := server.Serve(address); err != nil {
		log.Fatal(err)
	}
}
