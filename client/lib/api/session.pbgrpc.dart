///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'session.pb.dart' as $1;
export 'session.pb.dart';

class SessionClient extends $grpc.Client {
  static final _$open = $grpc.ClientMethod<$0.Empty, $1.Token>(
      '/internal.Session/Open',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Token.fromBuffer(value));
  static final _$close = $grpc.ClientMethod<$1.Token, $0.Empty>(
      '/internal.Session/Close',
      ($1.Token value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  SessionClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.Token> open($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$open, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> close($1.Token request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$close, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class SessionServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Session';

  SessionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Token>(
        'Open',
        open_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Token value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Token, $0.Empty>(
        'Close',
        close_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Token.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Token> open_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return open(call, await request);
  }

  $async.Future<$0.Empty> close_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Token> request) async {
    return close(call, await request);
  }

  $async.Future<$1.Token> open($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> close($grpc.ServiceCall call, $1.Token request);
}
