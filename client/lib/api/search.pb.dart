///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'session.pb.dart' as $1;

export 'search.pbenum.dart';

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

