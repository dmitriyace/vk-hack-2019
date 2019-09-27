package http

import (
	"io"
	"net/url"
	"time"
)

type requestBuilder struct {
	url     string
	method  string
	body    io.Reader
	params  url.Values
	timeout time.Duration
}

func ReqBuilder() RequestBuilder {
	return &requestBuilder{}
}

func (rb *requestBuilder) Url(v string) RequestBuilder {
	rb.url = v
	return rb
}

func (rb *requestBuilder) Params(v url.Values) RequestBuilder {
	rb.params = v
	return rb
}

func (rb *requestBuilder) Timeout(t time.Duration) RequestBuilder {
	rb.timeout = t
	return rb
}

func (rb *requestBuilder) Method(m string) RequestBuilder {
	rb.method = m
	return rb
}

func (rb *requestBuilder) Body(b io.Reader) RequestBuilder {
	rb.body = b
	return rb
}

func (rb *requestBuilder) Build() Request {
	return Request{
		url:     rb.url,
		method:  rb.method,
		params:  rb.params,
		body:    rb.body,
		timeout: rb.timeout,
	}
}
