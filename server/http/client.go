package http

import (
	"io"
	"net/url"
	"time"
)

type Request struct {
	url     string
	method  string
	params  url.Values
	body    io.Reader
	timeout time.Duration
}

type RequestBuilder interface {
	Url(string) RequestBuilder
	Params(url.Values) RequestBuilder
	Method(string) RequestBuilder
	Body(io.Reader) RequestBuilder
	Timeout(time.Duration) RequestBuilder
	Build() Request
}

func (r *Request) Do() (io.ReadCloser, error) {
	return nil, nil
}
