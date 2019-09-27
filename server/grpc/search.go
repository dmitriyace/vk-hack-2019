package grpc

import (
	"context"
	"encoding/json"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"github.com/N1cOs/vkhack2019/server/http"
	"github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/peer"
	"google.golang.org/grpc/status"
	"net/url"
	"strings"
)

func (s *Server) CityByIp(ctx context.Context, e *empty.Empty) (*it.City, error) {
	pr, ok := peer.FromContext(ctx)
	if !ok {
		err := status.Error(codes.InvalidArgument, "Could not determine public ip address")
		return nil, err
	}

	address := pr.Addr.String()
	ip := address[:strings.Index(address, ":")]

	params := url.Values{}
	params.Set("locale", "ru")
	params.Set("ip", ip)

	builder := http.NewBuilder()
	req := builder.Method("GET").Url(urlIpSearch).Params(params).Repeats(1).Build()
	body, err := req.Do()
	if err != nil {
		return nil, err
	}
	defer body.Close()

	respObj := struct {
		Iata    string
		Name    string
		Country string `json:"country_name"`
	}{}

	err = json.NewDecoder(body).Decode(&respObj)
	if err != nil {
		err := status.Error(codes.Internal, "Json unmarshalling error")
		return nil, err
	}

	city := it.City{
		Iata:        respObj.Iata,
		Name:        respObj.Name,
		CountryName: respObj.Country,
	}
	return &city, nil
}

func (s *Server) GetTrips(context.Context, *it.Token) (*it.Trips, error) {
	return nil, nil
}
