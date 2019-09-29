package grpc

import (
	"encoding/json"
	"github.com/N1cOs/vkhack2019/server/http"
	"net/url"
)

type Flight struct {
	Price int
}

type Response struct {
	Success bool
	Data    map[string]map[string]Flight
	Err     error
}

func cheapFlights(dest, month string, ch chan Response) {
	resp := Response{}

	params := url.Values{}
	params.Set("origin", "LED")
	params.Set("destination", dest)
	params.Set("depart_date", month)
	params.Set("token", Token)

	b := http.NewBuilder()
	req := b.Url(urlMonthFlights).Params(params).Build()

	body, err := req.Do()
	if err != nil {
		resp.Err = err
		ch <- resp
	}

	err = json.NewDecoder(body).Decode(&resp)
	if err != nil {
		resp.Err = err
		ch <- resp
	}

	ch <- resp
}
