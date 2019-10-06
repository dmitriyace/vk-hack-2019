package grpc

import (
	"context"
	"fmt"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"math/rand"
	"time"
)

func (s *Server) GetRandom(ctx context.Context, token *it.Token) (*it.Cities, error) {
	rand.Seed(time.Now().UnixNano())

	session, err := GetSession(token.Value)
	if err != nil {
		return nil, err
	}

	cities := session.randomCities
	if len(cities) < 2 {
		return nil, status.Error(codes.Unavailable, "Only one city left")
	}

	index1, index2 := rand.Intn(len(cities)), rand.Intn(len(cities))
	for index1 == index2 {
		index2 = rand.Intn(len(cities))
	}
	c1, c2 := cities[index1], cities[index2]

	var cc []*it.City
	for _, c := range []*City{c1, c2} {
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

func (s *Server) DeleteRandom(ctx context.Context, req *it.AnswerRequest) (*empty.Empty, error) {
	session, err := GetSession(req.Token.Value)
	if err != nil {
		return nil, err
	}

	var cities []*City
	for _, c := range session.randomCities {
		if c.Iata != req.Iata {
			cities = append(cities, c)
		}
	}

	session.randomCities = cities
	return &empty.Empty{}, nil
}
