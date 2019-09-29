package grpc

import (
	"context"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"google.golang.org/grpc"
	"log"
	"net"
	"os"
	"time"
)

const (
	urlCities       = "http://api.travelpayouts.com/data/ru/cities.json"
	urlCountries    = "http://api.travelpayouts.com/data/ru/countries.json"
	urlPhoto        = "http://95.213.38.135/images/%s.jpg"
	urlMonthFlights = "http://api.travelpayouts.com/v1/prices/cheap"
	urlSearch       = "https://www.aviasales.ru/search"
)

var Token = os.Getenv("AVIA_TOKEN")

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
	it.RegisterSessionServer(server, s)
	it.RegisterWeightsServer(server, s)
	it.RegisterQuestionsServer(server, s)

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
