package grpc

import (
	"context"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"google.golang.org/grpc"
	"log"
	"net"
	"time"
)

const (
	urlIpSearch = "http://www.travelpayouts.com/whereami"
	urlAutocomplete = "http://autocomplete.travelpayouts.com/places2"
)

type Server struct {
}

func NewServer() *Server {
	return &Server{}
}

func (s *Server) Serve(address string) error {
	listener, err := net.Listen("tcp", address)
	if err != nil {
		return err
	}
	defer listener.Close()

	server := grpc.NewServer(grpc.UnaryInterceptor(logInterceptor))
	it.RegisterAutocompleteServer(server, s)

	return server.Serve(listener)
}

func logInterceptor(ctx context.Context, req interface{},
	info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	start := time.Now()
	resp, err := handler(ctx, req)

	elapsed := time.Since(start)
	log.Printf("%s (%dms)", info.FullMethod, elapsed.Milliseconds())

	return resp, err
}
