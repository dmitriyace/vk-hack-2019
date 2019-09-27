package grpc

import (
	"context"
	"encoding/json"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"github.com/N1cOs/vkhack2019/server/http"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"net/url"
	"strings"
	"time"
)

func (s *Server) City(ctx context.Context, query *it.CityAutocomplete) (*it.Cities, error) {
	params := url.Values{}
	params.Set("term", query.Value)
	params.Set("locale", "ru")
	params.Set("types[]", "city")

	builder := http.NewBuilder()
	req := builder.Method("GET").Url(urlAutocomplete).Params(params).
		Repeats(2).Timeout(time.Millisecond * 600).Build()
	body, err := req.Do()
	if err != nil {
		return nil, err
	}
	defer body.Close()

	type city struct {
		Code    string
		Name    string
		CountryName string `json:"country_name"`
		CountryCode string `json:"country_code"`
	}
	var cities []city

	err = json.NewDecoder(body).Decode(&cities)
	if err != nil {
		err := status.Error(codes.Internal, "Json unmarshalling error")
		return nil, err
	}

	var cc []*it.City
	if query.CountryCode != "" {
		for _, c := range cities {
			if strings.EqualFold(c.CountryCode, query.CountryCode) {
				city := &it.City{
					Iata:        c.Code,
					Name:        c.Name,
					CountryName: c.CountryName,
				}
				cc = append(cc, city)
			}
		}
	} else {
		for _, c := range cities {
			city := &it.City{
				Iata:        c.Code,
				Name:        c.Name,
				CountryName: c.CountryName,
			}
			cc = append(cc, city)
		}
	}

	return &it.Cities{Values: cc}, nil
}

func (s *Server) Country(ctx context.Context, query *it.CountryAutocomplete) (*it.Countries, error) {
	params := url.Values{}
	params.Set("term", query.Value)
	params.Set("locale", "ru")
	params.Set("types[]", "country")

	builder := http.NewBuilder()
	req := builder.Method("GET").Url(urlAutocomplete).Params(params).
		Repeats(2).Timeout(time.Millisecond * 600).Build()
	body, err := req.Do()
	if err != nil {
		return nil, err
	}
	defer body.Close()

	type country struct {
		Name string `json:"name"`
		Code string `json:"code"`
	}
	var countries []country

	err = json.NewDecoder(body).Decode(&countries)
	if err != nil {
		err := status.Error(codes.Internal, "Json unmarshalling error")
		return nil, err
	}

	var cc []*it.Country
	for _, c := range countries {
		country := it.Country{
			Code: c.Code,
			Name: c.Name,
		}
		cc = append(cc, &country)
	}

	return &it.Countries{Values: cc}, nil
}
