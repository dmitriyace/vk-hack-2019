///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'session.pb.dart' as $1;
import 'search.pb.dart' as $2;
import 'google/protobuf/empty.pb.dart' as $0;
export 'search.pb.dart';

class QuestionsClient extends $grpc.Client {
  static final _$getRandom = $grpc.ClientMethod<$1.Token, $2.Cities>(
      '/internal.Questions/GetRandom',
      ($1.Token value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Cities.fromBuffer(value));
  static final _$deleteRandom = $grpc.ClientMethod<$2.AnswerRequest, $0.Empty>(
      '/internal.Questions/DeleteRandom',
      ($2.AnswerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  QuestionsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$2.Cities> getRandom($1.Token request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getRandom, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> deleteRandom($2.AnswerRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteRandom, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class QuestionsServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Questions';

  QuestionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Token, $2.Cities>(
        'GetRandom',
        getRandom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Token.fromBuffer(value),
        ($2.Cities value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.AnswerRequest, $0.Empty>(
        'DeleteRandom',
        deleteRandom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.AnswerRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$2.Cities> getRandom_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Token> request) async {
    return getRandom(call, await request);
  }

  $async.Future<$0.Empty> deleteRandom_Pre(
      $grpc.ServiceCall call, $async.Future<$2.AnswerRequest> request) async {
    return deleteRandom(call, await request);
  }

  $async.Future<$2.Cities> getRandom($grpc.ServiceCall call, $1.Token request);
  $async.Future<$0.Empty> deleteRandom(
      $grpc.ServiceCall call, $2.AnswerRequest request);
}

class WeightsClient extends $grpc.Client {
  static final _$changeContinent =
      $grpc.ClientMethod<$2.ContinentDelta, $0.Empty>(
          '/internal.Weights/ChangeContinent',
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
  static final _$result = $grpc.ClientMethod<$2.ResultRequest, $2.Cities>(
      '/internal.Weights/Result',
      ($2.ResultRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Cities.fromBuffer(value));

  WeightsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Empty> changeContinent($2.ContinentDelta request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$changeContinent, $async.Stream.fromIterable([request]),
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

  $grpc.ResponseFuture<$2.Cities> result($2.ResultRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$result, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class WeightsServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Weights';

  WeightsServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ContinentDelta, $0.Empty>(
        'ChangeContinent',
        changeContinent_Pre,
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
    $addMethod($grpc.ServiceMethod<$2.ResultRequest, $2.Cities>(
        'Result',
        result_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ResultRequest.fromBuffer(value),
        ($2.Cities value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> changeContinent_Pre(
      $grpc.ServiceCall call, $async.Future<$2.ContinentDelta> request) async {
    return changeContinent(call, await request);
  }

  $async.Future<$0.Empty> changeCountry_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CountryDelta> request) async {
    return changeCountry(call, await request);
  }

  $async.Future<$0.Empty> changeCity_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CityDelta> request) async {
    return changeCity(call, await request);
  }

  $async.Future<$2.Cities> result_Pre(
      $grpc.ServiceCall call, $async.Future<$2.ResultRequest> request) async {
    return result(call, await request);
  }

  $async.Future<$0.Empty> changeContinent(
      $grpc.ServiceCall call, $2.ContinentDelta request);
  $async.Future<$0.Empty> changeCountry(
      $grpc.ServiceCall call, $2.CountryDelta request);
  $async.Future<$0.Empty> changeCity(
      $grpc.ServiceCall call, $2.CityDelta request);
  $async.Future<$2.Cities> result(
      $grpc.ServiceCall call, $2.ResultRequest request);
}
