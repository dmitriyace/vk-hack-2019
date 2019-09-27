INCLUDE=/usr/local/include/google/protobuf

all: dart go

dart:
	protoc --dart_out=grpc:../client/lib/api *.proto $(INCLUDE)/timestamp.proto $(INCLUDE)/empty.proto

go:
	protoc --go_out=plugins=grpc:../server/grpc/internal *.proto
