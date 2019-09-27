///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $4;
import 'autocomplete.pb.dart' as $0;

class Change extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Change', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'iata')
    ..a<$core.int>(2, 'duration', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Change._() : super();
  factory Change() => create();
  factory Change.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Change.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Change clone() => Change()..mergeFromMessage(this);
  Change copyWith(void Function(Change) updates) => super.copyWith((message) => updates(message as Change));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Change create() => Change._();
  Change createEmptyInstance() => create();
  static $pb.PbList<Change> createRepeated() => $pb.PbList<Change>();
  static Change getDefault() => _defaultInstance ??= create()..freeze();
  static Change _defaultInstance;

  $core.String get iata => $_getS(0, '');
  set iata($core.String v) { $_setString(0, v); }
  $core.bool hasIata() => $_has(0);
  void clearIata() => clearField(1);

  $core.int get duration => $_get(1, 0);
  set duration($core.int v) { $_setUnsignedInt32(1, v); }
  $core.bool hasDuration() => $_has(1);
  void clearDuration() => clearField(2);
}

class Segment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Segment', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..aOS(1, 'origin')
    ..aOS(2, 'dest')
    ..a<$core.int>(3, 'duration', $pb.PbFieldType.OU3)
    ..pc<Change>(4, 'changes', $pb.PbFieldType.PM, subBuilder: Change.create)
    ..a<$4.Timestamp>(5, 'takeOff', $pb.PbFieldType.OM, protoName: 'takeOff', defaultOrMaker: $4.Timestamp.getDefault, subBuilder: $4.Timestamp.create)
    ..a<$4.Timestamp>(6, 'landing', $pb.PbFieldType.OM, defaultOrMaker: $4.Timestamp.getDefault, subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Segment._() : super();
  factory Segment() => create();
  factory Segment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Segment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Segment clone() => Segment()..mergeFromMessage(this);
  Segment copyWith(void Function(Segment) updates) => super.copyWith((message) => updates(message as Segment));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Segment create() => Segment._();
  Segment createEmptyInstance() => create();
  static $pb.PbList<Segment> createRepeated() => $pb.PbList<Segment>();
  static Segment getDefault() => _defaultInstance ??= create()..freeze();
  static Segment _defaultInstance;

  $core.String get origin => $_getS(0, '');
  set origin($core.String v) { $_setString(0, v); }
  $core.bool hasOrigin() => $_has(0);
  void clearOrigin() => clearField(1);

  $core.String get dest => $_getS(1, '');
  set dest($core.String v) { $_setString(1, v); }
  $core.bool hasDest() => $_has(1);
  void clearDest() => clearField(2);

  $core.int get duration => $_get(2, 0);
  set duration($core.int v) { $_setUnsignedInt32(2, v); }
  $core.bool hasDuration() => $_has(2);
  void clearDuration() => clearField(3);

  $core.List<Change> get changes => $_getList(3);

  $4.Timestamp get takeOff => $_getN(4);
  set takeOff($4.Timestamp v) { setField(5, v); }
  $core.bool hasTakeOff() => $_has(4);
  void clearTakeOff() => clearField(5);

  $4.Timestamp get landing => $_getN(5);
  set landing($4.Timestamp v) { setField(6, v); }
  $core.bool hasLanding() => $_has(5);
  void clearLanding() => clearField(6);
}

class Flight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Flight', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$core.int>(1, 'price', $pb.PbFieldType.OU3)
    ..a<Segment>(2, 'depart', $pb.PbFieldType.OM, defaultOrMaker: Segment.getDefault, subBuilder: Segment.create)
    ..a<Segment>(3, 'return', $pb.PbFieldType.OM, defaultOrMaker: Segment.getDefault, subBuilder: Segment.create)
    ..hasRequiredFields = false
  ;

  Flight._() : super();
  factory Flight() => create();
  factory Flight.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Flight.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Flight clone() => Flight()..mergeFromMessage(this);
  Flight copyWith(void Function(Flight) updates) => super.copyWith((message) => updates(message as Flight));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Flight create() => Flight._();
  Flight createEmptyInstance() => create();
  static $pb.PbList<Flight> createRepeated() => $pb.PbList<Flight>();
  static Flight getDefault() => _defaultInstance ??= create()..freeze();
  static Flight _defaultInstance;

  $core.int get price => $_get(0, 0);
  set price($core.int v) { $_setUnsignedInt32(0, v); }
  $core.bool hasPrice() => $_has(0);
  void clearPrice() => clearField(1);

  Segment get depart => $_getN(1);
  set depart(Segment v) { setField(2, v); }
  $core.bool hasDepart() => $_has(1);
  void clearDepart() => clearField(2);

  Segment get return_3 => $_getN(2);
  set return_3(Segment v) { setField(3, v); }
  $core.bool hasReturn_3() => $_has(2);
  void clearReturn_3() => clearField(3);
}

class Hotel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Hotel', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$core.int>(1, 'id', $pb.PbFieldType.OU3)
    ..aOS(2, 'name')
    ..hasRequiredFields = false
  ;

  Hotel._() : super();
  factory Hotel() => create();
  factory Hotel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hotel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Hotel clone() => Hotel()..mergeFromMessage(this);
  Hotel copyWith(void Function(Hotel) updates) => super.copyWith((message) => updates(message as Hotel));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hotel create() => Hotel._();
  Hotel createEmptyInstance() => create();
  static $pb.PbList<Hotel> createRepeated() => $pb.PbList<Hotel>();
  static Hotel getDefault() => _defaultInstance ??= create()..freeze();
  static Hotel _defaultInstance;

  $core.int get id => $_get(0, 0);
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get name => $_getS(1, '');
  set name($core.String v) { $_setString(1, v); }
  $core.bool hasName() => $_has(1);
  void clearName() => clearField(2);
}

class Package extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Package', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<Flight>(1, 'flight', $pb.PbFieldType.OM, defaultOrMaker: Flight.getDefault, subBuilder: Flight.create)
    ..p<$core.int>(2, 'hotels', $pb.PbFieldType.PU3)
    ..hasRequiredFields = false
  ;

  Package._() : super();
  factory Package() => create();
  factory Package.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Package.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Package clone() => Package()..mergeFromMessage(this);
  Package copyWith(void Function(Package) updates) => super.copyWith((message) => updates(message as Package));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Package create() => Package._();
  Package createEmptyInstance() => create();
  static $pb.PbList<Package> createRepeated() => $pb.PbList<Package>();
  static Package getDefault() => _defaultInstance ??= create()..freeze();
  static Package _defaultInstance;

  Flight get flight => $_getN(0);
  set flight(Flight v) { setField(1, v); }
  $core.bool hasFlight() => $_has(0);
  void clearFlight() => clearField(1);

  $core.List<$core.int> get hotels => $_getList(1);
}

class Trip extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Trip', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..a<$0.City>(1, 'city', $pb.PbFieldType.OM, defaultOrMaker: $0.City.getDefault, subBuilder: $0.City.create)
    ..a<$0.Country>(2, 'country', $pb.PbFieldType.OM, defaultOrMaker: $0.Country.getDefault, subBuilder: $0.Country.create)
    ..pc<Package>(3, 'packages', $pb.PbFieldType.PM, subBuilder: Package.create)
    ..pc<Hotel>(4, 'hotels', $pb.PbFieldType.PM, subBuilder: Hotel.create)
    ..hasRequiredFields = false
  ;

  Trip._() : super();
  factory Trip() => create();
  factory Trip.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trip.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Trip clone() => Trip()..mergeFromMessage(this);
  Trip copyWith(void Function(Trip) updates) => super.copyWith((message) => updates(message as Trip));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trip create() => Trip._();
  Trip createEmptyInstance() => create();
  static $pb.PbList<Trip> createRepeated() => $pb.PbList<Trip>();
  static Trip getDefault() => _defaultInstance ??= create()..freeze();
  static Trip _defaultInstance;

  $0.City get city => $_getN(0);
  set city($0.City v) { setField(1, v); }
  $core.bool hasCity() => $_has(0);
  void clearCity() => clearField(1);

  $0.Country get country => $_getN(1);
  set country($0.Country v) { setField(2, v); }
  $core.bool hasCountry() => $_has(1);
  void clearCountry() => clearField(2);

  $core.List<Package> get packages => $_getList(2);

  $core.List<Hotel> get hotels => $_getList(3);
}

class Trips extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Trips', package: const $pb.PackageName('internal'), createEmptyInstance: create)
    ..pc<Trip>(1, 'values', $pb.PbFieldType.PM, subBuilder: Trip.create)
    ..hasRequiredFields = false
  ;

  Trips._() : super();
  factory Trips() => create();
  factory Trips.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trips.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Trips clone() => Trips()..mergeFromMessage(this);
  Trips copyWith(void Function(Trips) updates) => super.copyWith((message) => updates(message as Trips));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trips create() => Trips._();
  Trips createEmptyInstance() => create();
  static $pb.PbList<Trips> createRepeated() => $pb.PbList<Trips>();
  static Trips getDefault() => _defaultInstance ??= create()..freeze();
  static Trips _defaultInstance;

  $core.List<Trip> get values => $_getList(0);
}

