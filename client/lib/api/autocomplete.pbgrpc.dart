///
//  Generated code. Do not modify.
//  source: autocomplete.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'autocomplete.pb.dart' as $0;
export 'autocomplete.pb.dart';

class AutocompleteClient extends $grpc.Client {
  static final _$city = $grpc.ClientMethod<$0.CityAutocomplete, $0.Cities>(
      '/internal.Autocomplete/City',
      ($0.CityAutocomplete value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Cities.fromBuffer(value));
  static final _$country =
      $grpc.ClientMethod<$0.CountryAutocomplete, $0.Countries>(
          '/internal.Autocomplete/Country',
          ($0.CountryAutocomplete value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Countries.fromBuffer(value));

  AutocompleteClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Cities> city($0.CityAutocomplete request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$city, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Countries> country($0.CountryAutocomplete request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$country, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AutocompleteServiceBase extends $grpc.Service {
  $core.String get $name => 'internal.Autocomplete';

  AutocompleteServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CityAutocomplete, $0.Cities>(
        'City',
        city_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CityAutocomplete.fromBuffer(value),
        ($0.Cities value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CountryAutocomplete, $0.Countries>(
        'Country',
        country_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CountryAutocomplete.fromBuffer(value),
        ($0.Countries value) => value.writeToBuffer()));
  }

  $async.Future<$0.Cities> city_Pre($grpc.ServiceCall call,
      $async.Future<$0.CityAutocomplete> request) async {
    return city(call, await request);
  }

  $async.Future<$0.Countries> country_Pre($grpc.ServiceCall call,
      $async.Future<$0.CountryAutocomplete> request) async {
    return country(call, await request);
  }

  $async.Future<$0.Cities> city(
      $grpc.ServiceCall call, $0.CityAutocomplete request);
  $async.Future<$0.Countries> country(
      $grpc.ServiceCall call, $0.CountryAutocomplete request);
}
