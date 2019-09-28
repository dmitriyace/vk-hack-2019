package grpc

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	it "github.com/N1cOs/vkhack2019/server/grpc/internal"
	"github.com/N1cOs/vkhack2019/server/http"
	"github.com/golang/protobuf/ptypes/empty"
	"log"
	"sort"
)

const (
	Asia     = "asi"
	Europe   = "eur"
	Africa   = "afr"
	NAmerica = "nor"
	SAmerica = "sou"
)

var (
	latNAmerica1 = []float32{90, 90, 78.13, 57.5, 15, 15, 1.25, 1.25, 51, 60, 60}
	lonNAmerica1 = []float32{-168.75, -10, -10, -37.5, -30, -75, -82.5, -105, -180, -180,
		-168.75, 166.6, 180, 180}
	latNAmerica2 = []float32{51, 51, 60}
	lonNAmerica2 = []float32{166.6, 180, 180}

	latSAmerica = []float32{1.25, 1.25, 15, 15, -60, -60}
	lonSAmerica = []float32{-105, -82.5, -75, -30, -30, -105}

	latAfrica = []float32{15, 28.25, 35.42, 38, 33, 31.74, 29.54, 27.78, 11.3, 12.5, -60, -60}
	lonAfrica = []float32{-30, -13, -10, 10, 27.5, 34.58, 34.92, 34.46, 44.3, 52, 75, -30}

	latEurope = []float32{90, 90, 42.5, 42.5, 40.79, 41, 40.55, 40.40, 40.05, 39.17, 35.46,
		33, 38, 35.42, 28.25, 15, 57.5, 78.13}
	lonEurope = []float32{-10, 77.5, 48.8, 30, 28.81, 29, 27.31, 26.75, 26.36, 25.19, 27.91,
		27.5, 10, -10, -13, -30, -37.5, -10}

	latAsia1 = []float32{90, 42.5, 42.5, 40.79, 41, 40.55, 40.4, 40.05, 39.17, 35.46, 33, 31.74, 29.54,
		27.78, 11.3, 12.5, -60, -60, -31.88, -11.88, -10.27, 33.13, 51, 60, 90}
	lonAsia1 = []float32{77.5, 48.8, 30, 28.81, 29, 27.31, 26.75, 26.36, 25.19, 27.91, 27.5, 34.58, 34.92,
		34.46, 44.3, 52, 75, 110, 110, 110, 140, 140, 166.6, 180, 180}
	latAsia2 = []float32{90, 90, 60, 60}
	lonAsia2 = []float32{-180, -168.75, -168.75, -180}
)

type Coordinates struct {
	Lon float32
	Lat float32
}

type City struct {
	Iata        string `json:"code"`
	Name        string
	Coordinates Coordinates
	CountryCode string `json:"country_code"`
	Continent   string
	Weight      int
}

var cities []City

func (s *Server) ChangeContinent(ctx context.Context, delta *it.ContinentDelta) (*empty.Empty, error) {
	session, err := GetSession(delta.Token.Value)
	if err != nil {
		return nil, err
	}

	for i := range session.cities {
		deltaVal := delta.Targets[session.cities[i].Continent]
		if deltaVal != nil {
			session.cities[i].Weight += int(deltaVal.Value)
		}
	}

	return &empty.Empty{}, nil

}

func (s *Server) ChangeCountry(ctx context.Context, delta *it.CountryDelta) (*empty.Empty, error) {
	session, err := GetSession(delta.Token.Value)
	if err != nil {
		return nil, err
	}

	for i := range session.cities {
		deltaVal := delta.Targets[session.cities[i].CountryCode]
		if deltaVal != nil {
			session.cities[i].Weight += int(deltaVal.Value)
		}
	}

	return &empty.Empty{}, nil
}

func (s *Server) ChangeCity(ctx context.Context, delta *it.CityDelta) (*empty.Empty, error) {
	session, err := GetSession(delta.Token.Value)
	if err != nil {
		return nil, err
	}

	for i := range session.cities {
		deltaVal := delta.Targets[session.cities[i].Iata]
		if deltaVal != nil {
			session.cities[i].Weight += int(deltaVal.Value)
		}
	}

	return &empty.Empty{}, nil
}

func (s *Server) Result(ctx context.Context, req *it.ResultRequest) (*it.Cities, error) {
	session, err := GetSession(req.Token.Value)
	if err != nil {
		return nil, err
	}

	sort.Slice(session.cities, func(i, j int) bool {
		return session.cities[i].Weight > session.cities[j].Weight
	})

	var cc []*it.City
	for i := req.Offset; i < req.Offset+req.PageSize; i++ {
		c := session.cities[i]
		city := &it.City{
			Name:  c.Name,
			Photo: fmt.Sprintf(urlPhoto, c.Iata),
		}
		cc = append(cc, city)
	}

	return &it.Cities{Values: cc}, nil
}

func getCities() []City {
	if cities == nil {
		b := http.NewBuilder()
		req := b.Url(urlCities).Method("GET").Repeats(1).Build()

		body, err := req.Do()
		if err != nil {
			log.Fatal(err)
		}
		defer body.Close()

		err = json.NewDecoder(body).Decode(&cities)
		if err != nil {
			log.Fatal(err)
		}

		for i := range cities {
			con, _ := continent(cities[i].Coordinates)
			cities[i].Continent = con
		}
	}

	res := make([]City, len(cities))
	_ = copy(res, cities)

	return res
}

func continent(cs Coordinates) (string, error) {
	inNAmerica := contains(cs, polygon(latNAmerica1, lonNAmerica1)) ||
		contains(cs, polygon(latNAmerica2, lonNAmerica2))
	inAsia := contains(cs, polygon(latAsia1, lonAsia1)) ||
		contains(cs, polygon(latAsia1, lonAsia1))

	if inNAmerica {
		return NAmerica, nil
	} else if contains(cs, polygon(latSAmerica, lonSAmerica)) {
		return SAmerica, nil
	} else if contains(cs, polygon(latEurope, lonEurope)) {
		return Europe, nil
	} else if inAsia {
		return Asia, nil
	} else if contains(cs, polygon(latAfrica, lonAfrica)) {
		return Africa, nil
	} else {
		return "", errors.New("could not determine continent")
	}
}

func polygon(lat []float32, lon []float32) [][]float32 {
	var res [][]float32
	for i, _ := range lat {
		point := []float32{lat[i], lon[i]}
		res = append(res, point)
	}
	return res
}

func contains(cs Coordinates, polygon [][]float32) bool {
	res := false
	x, y := cs.Lat, cs.Lon

	for i, j := 0, len(polygon)-1; i < len(polygon); i, j = i+1, i {
		xi, yi := polygon[i][0], polygon[i][1]
		xj, yj := polygon[j][0], polygon[j][1]

		intersect := ((yi > y) != (yj > y)) && (x < (xj-xi)*(y-yi)/(yj-yi)+xi)
		if intersect {
			res = !res
		}
	}
	return res
}
