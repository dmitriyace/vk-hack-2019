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

type Session struct {
	reqs *it.Requirements
}

var Sessions = make(map[string]Session)

func (s *Server) Open(ctx context.Context, reqs *it.Requirements) (*it.Token, error) {
	token, err := uuid.NewRandom()
	if err != nil {
		log.Println(err)
		err := status.Error(codes.Internal, "Could not create uuid from ip")
		return nil, err
	}

	session := Session{
		reqs: reqs,
	}
	Sessions[token.String()] = session

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
