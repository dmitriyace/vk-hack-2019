///
//  Generated code. Do not modify.
//  source: autocomplete.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class City extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('City', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'iata')
    ..aOS(2, 'name')
    ..aOS(3, 'countryName', protoName: 'countryName')
    ..aOS(4, 'photoUrl', protoName: 'photoUrl')
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

  $core.String get countryName => $_getS(2, '');
  set countryName($core.String v) { $_setString(2, v); }
  $core.bool hasCountryName() => $_has(2);
  void clearCountryName() => clearField(3);

  $core.String get photoUrl => $_getS(3, '');
  set photoUrl($core.String v) { $_setString(3, v); }
  $core.bool hasPhotoUrl() => $_has(3);
  void clearPhotoUrl() => clearField(4);
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

class CityAutocomplete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CityAutocomplete', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'value')
    ..aOS(2, 'countryCode', protoName: 'countryCode')
    ..hasRequiredFields = false
  ;

  CityAutocomplete._() : super();
  factory CityAutocomplete() => create();
  factory CityAutocomplete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CityAutocomplete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CityAutocomplete clone() => CityAutocomplete()..mergeFromMessage(this);
  CityAutocomplete copyWith(void Function(CityAutocomplete) updates) => super.copyWith((message) => updates(message as CityAutocomplete));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CityAutocomplete create() => CityAutocomplete._();
  CityAutocomplete createEmptyInstance() => create();
  static $pb.PbList<CityAutocomplete> createRepeated() => $pb.PbList<CityAutocomplete>();
  static CityAutocomplete getDefault() => _defaultInstance ??= create()..freeze();
  static CityAutocomplete _defaultInstance;

  $core.String get value => $_getS(0, '');
  set value($core.String v) { $_setString(0, v); }
  $core.bool hasValue() => $_has(0);
  void clearValue() => clearField(1);

  $core.String get countryCode => $_getS(1, '');
  set countryCode($core.String v) { $_setString(1, v); }
  $core.bool hasCountryCode() => $_has(1);
  void clearCountryCode() => clearField(2);
}

class Country extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Country', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'code')
    ..aOS(2, 'name')
    ..hasRequiredFields = false
  ;

  Country._() : super();
  factory Country() => create();
  factory Country.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Country.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Country clone() => Country()..mergeFromMessage(this);
  Country copyWith(void Function(Country) updates) => super.copyWith((message) => updates(message as Country));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Country create() => Country._();
  Country createEmptyInstance() => create();
  static $pb.PbList<Country> createRepeated() => $pb.PbList<Country>();
  static Country getDefault() => _defaultInstance ??= create()..freeze();
  static Country _defaultInstance;

  $core.String get code => $_getS(0, '');
  set code($core.String v) { $_setString(0, v); }
  $core.bool hasCode() => $_has(0);
  void clearCode() => clearField(1);

  $core.String get name => $_getS(1, '');
  set name($core.String v) { $_setString(1, v); }
  $core.bool hasName() => $_has(1);
  void clearName() => clearField(2);
}

class Countries extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Countries', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..pc<Country>(1, 'values', $pb.PbFieldType.PM, subBuilder: Country.create)
    ..hasRequiredFields = false
  ;

  Countries._() : super();
  factory Countries() => create();
  factory Countries.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Countries.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Countries clone() => Countries()..mergeFromMessage(this);
  Countries copyWith(void Function(Countries) updates) => super.copyWith((message) => updates(message as Countries));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Countries create() => Countries._();
  Countries createEmptyInstance() => create();
  static $pb.PbList<Countries> createRepeated() => $pb.PbList<Countries>();
  static Countries getDefault() => _defaultInstance ??= create()..freeze();
  static Countries _defaultInstance;

  $core.List<Country> get values => $_getList(0);
}

class CountryAutocomplete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CountryAutocomplete', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'value')
    ..aOS(2, 'originIata', protoName: 'originIata')
    ..hasRequiredFields = false
  ;

  CountryAutocomplete._() : super();
  factory CountryAutocomplete() => create();
  factory CountryAutocomplete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountryAutocomplete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CountryAutocomplete clone() => CountryAutocomplete()..mergeFromMessage(this);
  CountryAutocomplete copyWith(void Function(CountryAutocomplete) updates) => super.copyWith((message) => updates(message as CountryAutocomplete));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CountryAutocomplete create() => CountryAutocomplete._();
  CountryAutocomplete createEmptyInstance() => create();
  static $pb.PbList<CountryAutocomplete> createRepeated() => $pb.PbList<CountryAutocomplete>();
  static CountryAutocomplete getDefault() => _defaultInstance ??= create()..freeze();
  static CountryAutocomplete _defaultInstance;

  $core.String get value => $_getS(0, '');
  set value($core.String v) { $_setString(0, v); }
  $core.bool hasValue() => $_has(0);
  void clearValue() => clearField(1);

  $core.String get originIata => $_getS(1, '');
  set originIata($core.String v) { $_setString(1, v); }
  $core.bool hasOriginIata() => $_has(1);
  void clearOriginIata() => clearField(2);
}

