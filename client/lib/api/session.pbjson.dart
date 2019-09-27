///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Month$json = const {
  '1': 'Month',
  '2': const [
    const {'1': 'JANUARY', '2': 0},
    const {'1': 'FEBRUARY', '2': 1},
    const {'1': 'MARCH', '2': 2},
    const {'1': 'APRIL', '2': 3},
    const {'1': 'MAY', '2': 4},
    const {'1': 'JUNE', '2': 5},
    const {'1': 'JULY', '2': 6},
    const {'1': 'AUGUST', '2': 7},
    const {'1': 'SEPTEMBER', '2': 8},
    const {'1': 'OCTOBER', '2': 9},
    const {'1': 'NOVEMBER', '2': 10},
    const {'1': 'DECEMBER', '2': 11},
  ],
};

const Continent$json = const {
  '1': 'Continent',
  '2': const [
    const {'1': 'EUROPE', '2': 0},
    const {'1': 'ASIA', '2': 1},
    const {'1': 'AFRICA', '2': 2},
    const {'1': 'NORTH_AMERICA', '2': 3},
    const {'1': 'SOUTH_AMERICA', '2': 4},
  ],
};

const Requirements$json = const {
  '1': 'Requirements',
  '2': const [
    const {'1': 'originIata', '3': 1, '4': 1, '5': 9, '10': 'originIata'},
    const {'1': 'countryCode', '3': 2, '4': 1, '5': 9, '10': 'countryCode'},
    const {'1': 'cityIata', '3': 3, '4': 1, '5': 9, '10': 'cityIata'},
    const {'1': 'routes', '3': 4, '4': 3, '5': 14, '6': '.internal.Continent', '10': 'routes'},
    const {'1': 'month', '3': 5, '4': 1, '5': 14, '6': '.internal.Month', '10': 'month'},
    const {'1': 'minTemp', '3': 6, '4': 1, '5': 5, '10': 'minTemp'},
    const {'1': 'maxTemp', '3': 7, '4': 1, '5': 5, '10': 'maxTemp'},
    const {'1': 'startDate', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startDate'},
    const {'1': 'endDate', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endDate'},
    const {'1': 'duration', '3': 10, '4': 1, '5': 13, '10': 'duration'},
    const {'1': 'adults', '3': 11, '4': 1, '5': 13, '10': 'adults'},
    const {'1': 'children', '3': 12, '4': 1, '5': 13, '10': 'children'},
    const {'1': 'budget', '3': 13, '4': 1, '5': 13, '10': 'budget'},
  ],
};

const Token$json = const {
  '1': 'Token',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

