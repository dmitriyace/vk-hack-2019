///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $4;

import 'session.pbenum.dart';

export 'session.pbenum.dart';

class Requirements extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Requirements', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'originIata', protoName: 'originIata')
    ..aOS(2, 'countryCode', protoName: 'countryCode')
    ..aOS(3, 'cityIata', protoName: 'cityIata')
    ..pc<Continent>(4, 'routes', $pb.PbFieldType.PE, valueOf: Continent.valueOf, enumValues: Continent.values)
    ..e<Month>(5, 'month', $pb.PbFieldType.OE, defaultOrMaker: Month.JANUARY, valueOf: Month.valueOf, enumValues: Month.values)
    ..a<$core.int>(6, 'minTemp', $pb.PbFieldType.O3, protoName: 'minTemp')
    ..a<$core.int>(7, 'maxTemp', $pb.PbFieldType.O3, protoName: 'maxTemp')
    ..a<$4.Timestamp>(8, 'startDate', $pb.PbFieldType.OM, protoName: 'startDate', defaultOrMaker: $4.Timestamp.getDefault, subBuilder: $4.Timestamp.create)
    ..a<$4.Timestamp>(9, 'endDate', $pb.PbFieldType.OM, protoName: 'endDate', defaultOrMaker: $4.Timestamp.getDefault, subBuilder: $4.Timestamp.create)
    ..a<$core.int>(10, 'duration', $pb.PbFieldType.OU3)
    ..a<$core.int>(11, 'adults', $pb.PbFieldType.OU3)
    ..a<$core.int>(12, 'children', $pb.PbFieldType.OU3)
    ..a<$core.int>(13, 'budget', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Requirements._() : super();
  factory Requirements() => create();
  factory Requirements.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Requirements.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Requirements clone() => Requirements()..mergeFromMessage(this);
  Requirements copyWith(void Function(Requirements) updates) => super.copyWith((message) => updates(message as Requirements));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Requirements create() => Requirements._();
  Requirements createEmptyInstance() => create();
  static $pb.PbList<Requirements> createRepeated() => $pb.PbList<Requirements>();
  static Requirements getDefault() => _defaultInstance ??= create()..freeze();
  static Requirements _defaultInstance;

  $core.String get originIata => $_getS(0, '');
  set originIata($core.String v) { $_setString(0, v); }
  $core.bool hasOriginIata() => $_has(0);
  void clearOriginIata() => clearField(1);

  $core.String get countryCode => $_getS(1, '');
  set countryCode($core.String v) { $_setString(1, v); }
  $core.bool hasCountryCode() => $_has(1);
  void clearCountryCode() => clearField(2);

  $core.String get cityIata => $_getS(2, '');
  set cityIata($core.String v) { $_setString(2, v); }
  $core.bool hasCityIata() => $_has(2);
  void clearCityIata() => clearField(3);

  $core.List<Continent> get routes => $_getList(3);

  Month get month => $_getN(4);
  set month(Month v) { setField(5, v); }
  $core.bool hasMonth() => $_has(4);
  void clearMonth() => clearField(5);

  $core.int get minTemp => $_get(5, 0);
  set minTemp($core.int v) { $_setSignedInt32(5, v); }
  $core.bool hasMinTemp() => $_has(5);
  void clearMinTemp() => clearField(6);

  $core.int get maxTemp => $_get(6, 0);
  set maxTemp($core.int v) { $_setSignedInt32(6, v); }
  $core.bool hasMaxTemp() => $_has(6);
  void clearMaxTemp() => clearField(7);

  $4.Timestamp get startDate => $_getN(7);
  set startDate($4.Timestamp v) { setField(8, v); }
  $core.bool hasStartDate() => $_has(7);
  void clearStartDate() => clearField(8);

  $4.Timestamp get endDate => $_getN(8);
  set endDate($4.Timestamp v) { setField(9, v); }
  $core.bool hasEndDate() => $_has(8);
  void clearEndDate() => clearField(9);

  $core.int get duration => $_get(9, 0);
  set duration($core.int v) { $_setUnsignedInt32(9, v); }
  $core.bool hasDuration() => $_has(9);
  void clearDuration() => clearField(10);

  $core.int get adults => $_get(10, 0);
  set adults($core.int v) { $_setUnsignedInt32(10, v); }
  $core.bool hasAdults() => $_has(10);
  void clearAdults() => clearField(11);

  $core.int get children => $_get(11, 0);
  set children($core.int v) { $_setUnsignedInt32(11, v); }
  $core.bool hasChildren() => $_has(11);
  void clearChildren() => clearField(12);

  $core.int get budget => $_get(12, 0);
  set budget($core.int v) { $_setUnsignedInt32(12, v); }
  $core.bool hasBudget() => $_has(12);
  void clearBudget() => clearField(13);
}

class Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Token', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'value')
    ..hasRequiredFields = false
  ;

  Token._() : super();
  factory Token() => create();
  factory Token.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Token clone() => Token()..mergeFromMessage(this);
  Token copyWith(void Function(Token) updates) => super.copyWith((message) => updates(message as Token));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  static Token getDefault() => _defaultInstance ??= create()..freeze();
  static Token _defaultInstance;

  $core.String get value => $_getS(0, '');
  set value($core.String v) { $_setString(0, v); }
  $core.bool hasValue() => $_has(0);
  void clearValue() => clearField(1);
}

