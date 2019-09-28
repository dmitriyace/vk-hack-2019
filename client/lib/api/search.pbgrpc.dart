///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/wrappers.pb.dart' as $2;
import 'search.pb.dart' as $3;
import 'google/protobuf/empty.pb.dart' as $0;
export 'search.pb.dart';

class QuestionsClient extends $grpc.Client {
  static final _$random = $grpc.ClientMethod<$2.UInt32Value, $3.Cities>(
      '/internal.Questions/Random',
      ($2.UInt32Value value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Cities.fromBuffer(value));

  QuestionsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$3.Cities> random($2.UInt32Value request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$random, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class QuestionsServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Questions';

  QuestionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UInt32Value, $3.Cities>(
        'Random',
        random_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UInt32Value.fromBuffer(value),
        ($3.Cities value) => value.writeToBuffer()));
  }

  $async.Future<$3.Cities> random_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UInt32Value> request) async {
    return random(call, await request);
  }

  $async.Future<$3.Cities> random(
      $grpc.ServiceCall call, $2.UInt32Value request);
}

class WeightsClient extends $grpc.Client {
  static final _$changeContinent =
      $grpc.ClientMethod<$3.ContinentDelta, $0.Empty>(
          '/internal.Weights/ChangeContinent',
          ($3.ContinentDelta value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$changeCountry = $grpc.ClientMethod<$3.CountryDelta, $0.Empty>(
      '/internal.Weights/ChangeCountry',
      ($3.CountryDelta value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$changeCity = $grpc.ClientMethod<$3.CityDelta, $0.Empty>(
      '/internal.Weights/ChangeCity',
      ($3.CityDelta value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$result = $grpc.ClientMethod<$3.ResultRequest, $3.Cities>(
      '/internal.Weights/Result',
      ($3.ResultRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Cities.fromBuffer(value));

  WeightsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Empty> changeContinent($3.ContinentDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeContinent, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> changeCountry($3.CountryDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeCountry, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> changeCity($3.CityDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeCity, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$3.Cities> result($3.ResultRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$result, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class WeightsServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Weights';

  WeightsServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.ContinentDelta, $0.Empty>(
        'ChangeContinent',
        changeContinent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ContinentDelta.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CountryDelta, $0.Empty>(
        'ChangeCountry',
        changeCountry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CountryDelta.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CityDelta, $0.Empty>(
        'ChangeCity',
        changeCity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CityDelta.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ResultRequest, $3.Cities>(
        'Result',
        result_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ResultRequest.fromBuffer(value),
        ($3.Cities value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> changeContinent_Pre(
      $grpc.ServiceCall call, $async.Future<$3.ContinentDelta> request) async {
    return changeContinent(call, await request);
  }

  $async.Future<$0.Empty> changeCountry_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CountryDelta> request) async {
    return changeCountry(call, await request);
  }

  $async.Future<$0.Empty> changeCity_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CityDelta> request) async {
    return changeCity(call, await request);
  }

  $async.Future<$3.Cities> result_Pre(
      $grpc.ServiceCall call, $async.Future<$3.ResultRequest> request) async {
    return result(call, await request);
  }

  $async.Future<$0.Empty> changeContinent(
      $grpc.ServiceCall call, $3.ContinentDelta request);
  $async.Future<$0.Empty> changeCountry(
      $grpc.ServiceCall call, $3.CountryDelta request);
  $async.Future<$0.Empty> changeCity(
      $grpc.ServiceCall call, $3.CityDelta request);
  $async.Future<$3.Cities> result(
      $grpc.ServiceCall call, $3.ResultRequest request);
}
