///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'search.pb.dart' as $2;
import 'google/protobuf/empty.pb.dart' as $0;
export 'search.pb.dart';

class WeightsClient extends $grpc.Client {
  static final _$changeContinet =
      $grpc.ClientMethod<$2.ContinentDelta, $0.Empty>(
          '/internal.Weights/ChangeContinet',
          ($2.ContinentDelta value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$changeCountry = $grpc.ClientMethod<$2.CountryDelta, $0.Empty>(
      '/internal.Weights/ChangeCountry',
      ($2.CountryDelta value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$changeCity = $grpc.ClientMethod<$2.CityDelta, $0.Empty>(
      '/internal.Weights/ChangeCity',
      ($2.CityDelta value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  WeightsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Empty> changeContinet($2.ContinentDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeContinet, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> changeCountry($2.CountryDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeCountry, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> changeCity($2.CityDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeCity, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class WeightsServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Weights';

  WeightsServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ContinentDelta, $0.Empty>(
        'ChangeContinet',
        changeContinet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ContinentDelta.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CountryDelta, $0.Empty>(
        'ChangeCountry',
        changeCountry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CountryDelta.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CityDelta, $0.Empty>(
        'ChangeCity',
        changeCity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CityDelta.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> changeContinet_Pre(
      $grpc.ServiceCall call, $async.Future<$2.ContinentDelta> request) async {
    return changeContinet(call, await request);
  }

  $async.Future<$0.Empty> changeCountry_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CountryDelta> request) async {
    return changeCountry(call, await request);
  }

  $async.Future<$0.Empty> changeCity_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CityDelta> request) async {
    return changeCity(call, await request);
  }

  $async.Future<$0.Empty> changeContinet(
      $grpc.ServiceCall call, $2.ContinentDelta request);
  $async.Future<$0.Empty> changeCountry(
      $grpc.ServiceCall call, $2.CountryDelta request);
  $async.Future<$0.Empty> changeCity(
      $grpc.ServiceCall call, $2.CityDelta request);
}
