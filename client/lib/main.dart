import 'package:client/api/google/protobuf/timestamp.pb.dart';
import 'package:client/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'api/autocomplete.pb.dart';
import 'api/autocomplete.pbgrpc.dart';
import 'api/session.pb.dart';
import 'model/question.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _GlobalParent();
  }
}

class _GlobalParent extends StatefulWidget {
  @override
  _GlobalParentState createState() => _GlobalParentState();
}

class _GlobalParentState extends State<_GlobalParent> {
  static var _channel = ClientChannel('192.168.43.95',
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()));
  List<Question> _introQuestions = [
    Question(0, 'Укажите город отправления', QuestionType.AUTOCOMPLETE, () {
      return 1;
    },
        false,
        AutocompleteQuestionPayload((String pattern) async {
          if (pattern != '') {
            var autocomplete = CityAutocomplete();
            autocomplete.value = pattern;
            Cities result;
            await AutocompleteClient(_channel)
                .city(autocomplete)
                .then((el) => result = el);
            return Future<List>.value(List.of(result.values));
          }
          return Future<List>.value([]);
        }, (Requirements requirements, String model, Function cont) {
          if (model == '') {
            requirements.originIata = model;
            cont();
          }
        })),
    Question(1, 'Страна назначения', QuestionType.AUTOCOMPLETE, () {
      return 2;
    },
        true,
        AutocompleteQuestionPayload((String pattern) async {
          if (pattern != '') {
            var autocomplete = CountryAutocomplete();
            autocomplete.value = pattern;
            Countries result;
            await AutocompleteClient(_channel)
                .country(autocomplete)
                .then((el) => result = el);
            return Future<List>.value(List.of(result.values));
          }
          return Future<List>.value(List.of([]));
        }, (Requirements requirements, String model, Function cont) {
          if (model == '') {
            requirements.countryCode = model;
            cont();
          }
        })),
    Question(2, 'Город назначения', QuestionType.AUTOCOMPLETE, () {
      return 3;
    },
        true,
        AutocompleteQuestionPayload((String pattern) async {
          if (pattern != '') {
            var autocomplete = CityAutocomplete();
            autocomplete.value = pattern;
            Cities result;
            await AutocompleteClient(_channel)
                .city(autocomplete)
                .then((el) => result = el);
            return Future<List>.value(List.of(result.values));
          }
          return Future<List>.value(List.of([]));
        }, (Requirements requirements, String model, Function cont) {
          if (model == '') {
            requirements.cityIata = model;
            cont();
          }
        })),
    Question(3, 'Направление', QuestionType.MULTIPLE_SELECT_GRID, () {
      return 4;
    },
        false,
        MultipleSelectGridPayload([
          GridItem('Африка', null),
          GridItem('Северная Америка', null),
          GridItem('Южная Америка', null),
          GridItem('Европа', null),
          GridItem('Азия', null),
          GridItem('Океания', null)
        ], (Requirements requirements, List<Continent> model, Function cont) {
          //requirements.routes = model;
          cont();
        })),
    Question(4, 'Температуры', QuestionType.TWO_SIDED_SLIDER, () {
      return 5;
    },
        true,
        TwoSidedSliderQuestionPayload(
          -23.0,
          44.0,
          (Requirements requirements, RangeValues model, Function cont) {
            //requirements.routes = model;
            cont();
          },
        )),
    Question(5, 'Даты', QuestionType.TOUR_DATES, () {
      return 6;
    },
        true,
        TourDatesPayload(
          30,
          (Requirements requirements, RangeValues model, Function cont) {
            //requirements.routes = model;
            cont();
          },
        ))
  ];
  bool _hasHistory = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Demo',
      home: HomePage(
          hasHistory: _hasHistory,
          introQuestions: _introQuestions,
          channel: _channel),
    );
  }
}
