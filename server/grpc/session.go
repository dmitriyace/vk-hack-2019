package grpc

import (
	"context"
	"fmt"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"github.com/golang/protobuf/ptypes/empty"
	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

var popularCityIatas = []string{"AGR", "AMS", "ATH", "AYT", "BCN", "BER", "BKK", "BOM", "CAI", "CAN", "CUN",
	"DEL", "DPS", "DUB", "DXB", "FLR", "HKG", "HKT", "IST", "JAI", "JHB", "JNB", "KUL", "LAS", "LAX", "LON",
	"MAA", "MAD", "MFM", "MIA", "MIL", "MOW", "NYC", "ORL", "OSA", "PAR", "PRG", "ROM", "RUH", "SEL", "SHA",
	"SIN", "TPE", "TYO", "UTP", "VCE", "VIE"}

type CityInfo struct {
	City   *City
	Weight int
}

type Session struct {
	cities       []CityInfo
	randomCities []*City
}

var Sessions = make(map[string]*Session)

func GetSession(token string) (*Session, error) {
	s, ok := Sessions[token]
	if !ok {
		msg := fmt.Sprintf("Session with token %s does not exist", token)
		err := status.Error(codes.InvalidArgument, msg)
		return nil, err
	}

	return s, nil
}

func (s *Server) Open(ctx context.Context, e *empty.Empty) (*it.Token, error) {
	token, err := uuid.NewRandom()
	if err != nil {
		log.Println(err)
		err := status.Error(codes.Internal, "Could not create uuid from ip")
		return nil, err
	}

	go func() {
		cc := getCities()

		iatas := make(map[string]bool)
		for _, c := range popularCityIatas {
			iatas[c] = true
		}

		var cities []CityInfo
		var popularCC []*City

		for i := range cc {
			info := CityInfo{
				City:   &cc[i],
				Weight: 0,
			}

			if iatas[cc[i].Iata] {
				popularCC = append(popularCC, &cc[i])
			}
			cities = append(cities, info)
		}

		session := &Session{
			cities:       cities,
			randomCities: popularCC,
		}
		Sessions[token.String()] = session
	}()

	t := it.Token{
		Value: token.String(),
	}

	return &t, nil
}

func (s *Server) Close(ctx context.Context, token *it.Token) (*empty.Empty, error) {
	_, ok := Sessions[token.Value]
	if !ok {
		msg := fmt.Sprintf("Session with token %s does not exist", token.Value)
		err := status.Error(codes.InvalidArgument, msg)
		return nil, err
	}

	delete(Sessions, token.Value)
	return &empty.Empty{}, nil
}
