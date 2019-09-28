///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Continent extends $pb.ProtobufEnum {
  static const Continent EUROPE = Continent._(0, 'EUROPE');
  static const Continent ASIA = Continent._(1, 'ASIA');
  static const Continent AFRICA = Continent._(2, 'AFRICA');
  static const Continent NORTH_AMERICA = Continent._(3, 'NORTH_AMERICA');
  static const Continent SOUTH_AMERICA = Continent._(4, 'SOUTH_AMERICA');
  static const Continent OCEANIA = Continent._(5, 'OCEANIA');

  static const $core.List<Continent> values = <Continent> [
    EUROPE,
    ASIA,
    AFRICA,
    NORTH_AMERICA,
    SOUTH_AMERICA,
    OCEANIA,
  ];

  static final $core.Map<$core.int, Continent> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Continent valueOf($core.int value) => _byValue[value];

  const Continent._($core.int v, $core.String n) : super(v, n);
}

