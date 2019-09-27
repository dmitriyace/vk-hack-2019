///
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Change$json = const {
  '1': 'Change',
  '2': const [
    const {'1': 'iata', '3': 1, '4': 1, '5': 9, '10': 'iata'},
    const {'1': 'duration', '3': 2, '4': 1, '5': 13, '10': 'duration'},
  ],
};

const Segment$json = const {
  '1': 'Segment',
  '2': const [
    const {'1': 'origin', '3': 1, '4': 1, '5': 9, '10': 'origin'},
    const {'1': 'dest', '3': 2, '4': 1, '5': 9, '10': 'dest'},
    const {'1': 'duration', '3': 3, '4': 1, '5': 13, '10': 'duration'},
    const {'1': 'changes', '3': 4, '4': 3, '5': 11, '6': '.internal.Change', '10': 'changes'},
    const {'1': 'takeOff', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'takeOff'},
    const {'1': 'landing', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'landing'},
  ],
};

const Flight$json = const {
  '1': 'Flight',
  '2': const [
    const {'1': 'price', '3': 1, '4': 1, '5': 13, '10': 'price'},
    const {'1': 'depart', '3': 2, '4': 1, '5': 11, '6': '.internal.Segment', '10': 'depart'},
    const {'1': 'return', '3': 3, '4': 1, '5': 11, '6': '.internal.Segment', '10': 'return'},
  ],
};

const Hotel$json = const {
  '1': 'Hotel',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

const Package$json = const {
  '1': 'Package',
  '2': const [
    const {'1': 'flight', '3': 1, '4': 1, '5': 11, '6': '.internal.Flight', '10': 'flight'},
    const {'1': 'hotels', '3': 2, '4': 3, '5': 13, '10': 'hotels'},
  ],
};

const Trip$json = const {
  '1': 'Trip',
  '2': const [
    const {'1': 'city', '3': 1, '4': 1, '5': 11, '6': '.internal.City', '10': 'city'},
    const {'1': 'country', '3': 2, '4': 1, '5': 11, '6': '.internal.Country', '10': 'country'},
    const {'1': 'packages', '3': 3, '4': 3, '5': 11, '6': '.internal.Package', '10': 'packages'},
    const {'1': 'hotels', '3': 4, '4': 3, '5': 11, '6': '.internal.Hotel', '10': 'hotels'},
  ],
};

const Trips$json = const {
  '1': 'Trips',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.internal.Trip', '10': 'values'},
  ],
};

