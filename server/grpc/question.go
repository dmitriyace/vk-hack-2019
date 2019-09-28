package grpc

import (
	"context"
	"fmt"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"github.com/golang/protobuf/ptypes/empty"
	"math/rand"
	"time"
)

func (s *Server) Random(ctx context.Context, e *empty.Empty) (*it.Cities, error) {
	rand.Seed(time.Now().UnixNano())
	cities := getCities()

	index := rand.Intn(len(cities) / 2)
	c1, c2 := cities[index], cities[len(cities)/2+index-1]

	var cc []*it.City
	for _, c := range []City{c1, c2} {
		city := &it.City{
			Iata:        c.Iata,
			Name:        c.Name,
			CountryCode: c.CountryCode,
			Photo:       fmt.Sprintf(urlPhoto, c.Iata),
		}
		cc = append(cc, city)
	}
	return &it.Cities{Values: cc}, nil
}
