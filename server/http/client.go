package http

import (
	"fmt"
	"github.com/motemen/go-loghttp"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"io"
	"log"
	"net/http"
	"net/url"
	"time"
)

var client = http.Client{
	Transport: &loghttp.Transport{
		LogRequest: func(req *http.Request) {},
	},
	Timeout: time.Second * 5,
}

type RequestBuilder interface {
	Url(string) RequestBuilder
	Params(url.Values) RequestBuilder
	Method(string) RequestBuilder
	Body(io.Reader) RequestBuilder
	Timeout(time.Duration) RequestBuilder
	Repeats(int) RequestBuilder
	Build() Request
}

type Response struct {
	Value *http.Response
	Error error
}

type Request struct {
	url     string
	method  string
	params  url.Values
	repeats int
	body    io.Reader
	timeout time.Duration
}

func (r *Request) Do() (io.ReadCloser, error) {
	reqUrl := fmt.Sprintf("%s?%s", r.url, r.params.Encode())
	for i := 0; i < r.repeats; i++ {
		ch := make(chan Response)
		go func() {
			req, err := http.NewRequest(r.method, reqUrl, r.body)
			if err != nil {
				ch <- Response{
					Value: nil,
					Error: err,
				}
			}

			resp, err := client.Do(req)
			ch <- Response{
				Value: resp,
				Error: err,
			}
		}()

		tout := time.After(r.timeout)
		select {
		case r := <-ch:
			if r.Error != nil {
				msg := fmt.Sprintf("Request error, host: %s", reqUrl)
				return nil, status.Error(codes.Unavailable, msg)
			}
			return r.Value.Body, nil
		case <-tout:
			log.Printf("Request %s took more than %dms, repeats: %d", reqUrl,
				r.timeout.Milliseconds(), i+1)
		}
	}

	msg := fmt.Sprintf("Host %s unavailable", reqUrl)
	return nil, status.Error(codes.Unavailable, msg)
}
