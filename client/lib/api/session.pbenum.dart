///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Month extends $pb.ProtobufEnum {
  static const Month JANUARY = Month._(0, 'JANUARY');
  static const Month FEBRUARY = Month._(1, 'FEBRUARY');
  static const Month MARCH = Month._(2, 'MARCH');
  static const Month APRIL = Month._(3, 'APRIL');
  static const Month MAY = Month._(4, 'MAY');
  static const Month JUNE = Month._(5, 'JUNE');
  static const Month JULY = Month._(6, 'JULY');
  static const Month AUGUST = Month._(7, 'AUGUST');
  static const Month SEPTEMBER = Month._(8, 'SEPTEMBER');
  static const Month OCTOBER = Month._(9, 'OCTOBER');
  static const Month NOVEMBER = Month._(10, 'NOVEMBER');
  static const Month DECEMBER = Month._(11, 'DECEMBER');

  static const $core.List<Month> values = <Month> [
    JANUARY,
    FEBRUARY,
    MARCH,
    APRIL,
    MAY,
    JUNE,
    JULY,
    AUGUST,
    SEPTEMBER,
    OCTOBER,
    NOVEMBER,
    DECEMBER,
  ];

  static final $core.Map<$core.int, Month> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Month valueOf($core.int value) => _byValue[value];

  const Month._($core.int v, $core.String n) : super(v, n);
}

class Continent extends $pb.ProtobufEnum {
  static const Continent EUROPE = Continent._(0, 'EUROPE');
  static const Continent ASIA = Continent._(1, 'ASIA');
  static const Continent AFRICA = Continent._(2, 'AFRICA');
  static const Continent NORTH_AMERICA = Continent._(3, 'NORTH_AMERICA');
  static const Continent SOUTH_AMERICA = Continent._(4, 'SOUTH_AMERICA');

  static const $core.List<Continent> values = <Continent> [
    EUROPE,
    ASIA,
    AFRICA,
    NORTH_AMERICA,
    SOUTH_AMERICA,
  ];

  static final $core.Map<$core.int, Continent> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Continent valueOf($core.int value) => _byValue[value];

  const Continent._($core.int v, $core.String n) : super(v, n);
}

