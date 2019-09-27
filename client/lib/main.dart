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
    Question(
        0,
        'Укажите город отправления',
        QuestionType.AUTOCOMPLETE,
            () {
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
    Question(
        1,
        'Страна назначение',
        QuestionType.AUTOCOMPLETE,
            () {
          return 2;
        },
        false,
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
    Question(
        2,
        'Страна назначение',
        QuestionType.AUTOCOMPLETE,
            () {
          return 3;
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
          return Future<List>.value(List.of([]));
        }, (Requirements requirements, String model, Function cont) {
          if (model == '') {
            requirements.cityIata = model;
            cont();
          }
        })),
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
