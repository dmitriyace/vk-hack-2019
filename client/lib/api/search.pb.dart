///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'session.pb.dart' as $1;

class Delta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Delta', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$core.int>(1, 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Delta._() : super();
  factory Delta() => create();
  factory Delta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Delta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Delta clone() => Delta()..mergeFromMessage(this);
  Delta copyWith(void Function(Delta) updates) => super.copyWith((message) => updates(message as Delta));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Delta create() => Delta._();
  Delta createEmptyInstance() => create();
  static $pb.PbList<Delta> createRepeated() => $pb.PbList<Delta>();
  static Delta getDefault() => _defaultInstance ??= create()..freeze();
  static Delta _defaultInstance;

  $core.int get value => $_get(0, 0);
  set value($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasValue() => $_has(0);
  void clearValue() => clearField(1);
}

class ContinentDelta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContinentDelta', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$1.Token>(1, 'token', $pb.PbFieldType.OM, defaultOrMaker: $1.Token.getDefault, subBuilder: $1.Token.create)
    ..m<$core.String, Delta>(2, 'targets', entryClassName: 'ContinentDelta.TargetsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Delta.create, packageName: const $pb.PackageName('internal'))
    ..hasRequiredFields = false
  ;

  ContinentDelta._() : super();
  factory ContinentDelta() => create();
  factory ContinentDelta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContinentDelta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContinentDelta clone() => ContinentDelta()..mergeFromMessage(this);
  ContinentDelta copyWith(void Function(ContinentDelta) updates) => super.copyWith((message) => updates(message as ContinentDelta));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContinentDelta create() => ContinentDelta._();
  ContinentDelta createEmptyInstance() => create();
  static $pb.PbList<ContinentDelta> createRepeated() => $pb.PbList<ContinentDelta>();
  static ContinentDelta getDefault() => _defaultInstance ??= create()..freeze();
  static ContinentDelta _defaultInstance;

  $1.Token get token => $_getN(0);
  set token($1.Token v) { setField(1, v); }
  $core.bool hasToken() => $_has(0);
  void clearToken() => clearField(1);

  $core.Map<$core.String, Delta> get targets => $_getMap(1);
}

class CountryDelta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CountryDelta', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$1.Token>(1, 'token', $pb.PbFieldType.OM, defaultOrMaker: $1.Token.getDefault, subBuilder: $1.Token.create)
    ..m<$core.String, Delta>(2, 'targets', entryClassName: 'CountryDelta.TargetsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Delta.create, packageName: const $pb.PackageName('internal'))
    ..hasRequiredFields = false
  ;

  CountryDelta._() : super();
  factory CountryDelta() => create();
  factory CountryDelta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountryDelta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CountryDelta clone() => CountryDelta()..mergeFromMessage(this);
  CountryDelta copyWith(void Function(CountryDelta) updates) => super.copyWith((message) => updates(message as CountryDelta));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CountryDelta create() => CountryDelta._();
  CountryDelta createEmptyInstance() => create();
  static $pb.PbList<CountryDelta> createRepeated() => $pb.PbList<CountryDelta>();
  static CountryDelta getDefault() => _defaultInstance ??= create()..freeze();
  static CountryDelta _defaultInstance;

  $1.Token get token => $_getN(0);
  set token($1.Token v) { setField(1, v); }
  $core.bool hasToken() => $_has(0);
  void clearToken() => clearField(1);

  $core.Map<$core.String, Delta> get targets => $_getMap(1);
}

class CityDelta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CityDelta', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$1.Token>(1, 'token', $pb.PbFieldType.OM, defaultOrMaker: $1.Token.getDefault, subBuilder: $1.Token.create)
    ..m<$core.String, Delta>(2, 'targets', entryClassName: 'CityDelta.TargetsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Delta.create, packageName: const $pb.PackageName('internal'))
    ..hasRequiredFields = false
  ;

  CityDelta._() : super();
  factory CityDelta() => create();
  factory CityDelta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CityDelta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CityDelta clone() => CityDelta()..mergeFromMessage(this);
  CityDelta copyWith(void Function(CityDelta) updates) => super.copyWith((message) => updates(message as CityDelta));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CityDelta create() => CityDelta._();
  CityDelta createEmptyInstance() => create();
  static $pb.PbList<CityDelta> createRepeated() => $pb.PbList<CityDelta>();
  static CityDelta getDefault() => _defaultInstance ??= create()..freeze();
  static CityDelta _defaultInstance;

  $1.Token get token => $_getN(0);
  set token($1.Token v) { setField(1, v); }
  $core.bool hasToken() => $_has(0);
  void clearToken() => clearField(1);

  $core.Map<$core.String, Delta> get targets => $_getMap(1);
}

class City extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('City', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'iata')
    ..aOS(2, 'name')
    ..aOS(3, 'countryCode', protoName: 'countryCode')
    ..aOS(4, 'photo')
    ..hasRequiredFields = false
  ;

  City._() : super();
  factory City() => create();
  factory City.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory City.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  City clone() => City()..mergeFromMessage(this);
  City copyWith(void Function(City) updates) => super.copyWith((message) => updates(message as City));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static City create() => City._();
  City createEmptyInstance() => create();
  static $pb.PbList<City> createRepeated() => $pb.PbList<City>();
  static City getDefault() => _defaultInstance ??= create()..freeze();
  static City _defaultInstance;

  $core.String get iata => $_getS(0, '');
  set iata($core.String v) { $_setString(0, v); }
  $core.bool hasIata() => $_has(0);
  void clearIata() => clearField(1);

  $core.String get name => $_getS(1, '');
  set name($core.String v) { $_setString(1, v); }
  $core.bool hasName() => $_has(1);
  void clearName() => clearField(2);

  $core.String get countryCode => $_getS(2, '');
  set countryCode($core.String v) { $_setString(2, v); }
  $core.bool hasCountryCode() => $_has(2);
  void clearCountryCode() => clearField(3);

  $core.String get photo => $_getS(3, '');
  set photo($core.String v) { $_setString(3, v); }
  $core.bool hasPhoto() => $_has(3);
  void clearPhoto() => clearField(4);
}

class ResultRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResultRequest', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$1.Token>(1, 'token', $pb.PbFieldType.OM, defaultOrMaker: $1.Token.getDefault, subBuilder: $1.Token.create)
    ..a<$core.int>(2, 'pageSize', $pb.PbFieldType.OU3, protoName: 'pageSize')
    ..a<$core.int>(3, 'offset', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ResultRequest._() : super();
  factory ResultRequest() => create();
  factory ResultRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResultRequest clone() => ResultRequest()..mergeFromMessage(this);
  ResultRequest copyWith(void Function(ResultRequest) updates) => super.copyWith((message) => updates(message as ResultRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultRequest create() => ResultRequest._();
  ResultRequest createEmptyInstance() => create();
  static $pb.PbList<ResultRequest> createRepeated() => $pb.PbList<ResultRequest>();
  static ResultRequest getDefault() => _defaultInstance ??= create()..freeze();
  static ResultRequest _defaultInstance;

  $1.Token get token => $_getN(0);
  set token($1.Token v) { setField(1, v); }
  $core.bool hasToken() => $_has(0);
  void clearToken() => clearField(1);

  $core.int get pageSize => $_get(1, 0);
  set pageSize($core.int v) { $_setUnsignedInt32(1, v); }
  $core.bool hasPageSize() => $_has(1);
  void clearPageSize() => clearField(2);

  $core.int get offset => $_get(2, 0);
  set offset($core.int v) { $_setUnsignedInt32(2, v); }
  $core.bool hasOffset() => $_has(2);
  void clearOffset() => clearField(3);
}

class Cities extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Cities', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..pc<City>(1, 'values', $pb.PbFieldType.PM, subBuilder: City.create)
    ..hasRequiredFields = false
  ;

  Cities._() : super();
  factory Cities() => create();
  factory Cities.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Cities.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Cities clone() => Cities()..mergeFromMessage(this);
  Cities copyWith(void Function(Cities) updates) => super.copyWith((message) => updates(message as Cities));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Cities create() => Cities._();
  Cities createEmptyInstance() => create();
  static $pb.PbList<Cities> createRepeated() => $pb.PbList<Cities>();
  static Cities getDefault() => _defaultInstance ??= create()..freeze();
  static Cities _defaultInstance;

  $core.List<City> get values => $_getList(0);
}

