///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $2;
import 'autocomplete.pb.dart' as $0;
import 'session.pb.dart' as $1;
import 'search.pb.dart' as $3;
export 'search.pb.dart';

class SearcherClient extends $grpc.Client {
  static final _$cityByIp = $grpc.ClientMethod<$2.Empty, $0.City>(
      '/internal.Searcher/CityByIp',
      ($2.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.City.fromBuffer(value));
  static final _$getTrips = $grpc.ClientMethod<$1.Token, $3.Trips>(
      '/internal.Searcher/GetTrips',
      ($1.Token value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Trips.fromBuffer(value));

  SearcherClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.City> cityByIp($2.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$cityByIp, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$3.Trips> getTrips($1.Token request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getTrips, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class SearcherServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Searcher';

  SearcherServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.City>(
        'CityByIp',
        cityByIp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.City value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Token, $3.Trips>(
        'GetTrips',
        getTrips_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Token.fromBuffer(value),
        ($3.Trips value) => value.writeToBuffer()));
  }

  $async.Future<$0.City> cityByIp_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return cityByIp(call, await request);
  }

  $async.Future<$3.Trips> getTrips_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Token> request) async {
    return getTrips(call, await request);
  }

  $async.Future<$0.City> cityByIp($grpc.ServiceCall call, $2.Empty request);
  $async.Future<$3.Trips> getTrips($grpc.ServiceCall call, $1.Token request);
}
