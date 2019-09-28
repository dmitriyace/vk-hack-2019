import 'package:client/api/session.pbgrpc.dart';
import 'package:client/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

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
  static var _channel = ClientChannel('95.213.38.135',
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()));

  @override
  void dispose() {
    SessionClient(_channel).close(HomePage.token);
    super.dispose();
  }

  List<Question> _questions = [
    Question(
        0,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload(
            'Вы хотели бы увидеть одно из Семи Чудес Света вживую?',
            'Да!',
            'Без разницы'),
        null,
        null,
        {
          0: {"CAI": 7}
        }),
    Question(
        1,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload(
            'Как насчет искупаться в теплом море?', 'Определенно.', 'Не важно'),
        null,
        {
          0: {
            "BR": 5,
            "ES": 5,
            "FR": 5,
            "IT": 5,
            "GR": 5,
            "MA": 5,
            "TN": 5,
            "EG": 5,
            "TR": 5,
            "JP": 5,
            "TH": 5
          }
        },
        {
          0: {
            "LAS": 5,
            "RIO": 5,
            "BCN": 5,
            "NCE": 5,
            "MRS": 5,
            "HER": 5,
            "CAS": 5,
            "TUN": 5,
            "HRG": 5,
            "SSH": 5,
            "AYT": 5,
            "OSA": 5,
            "BKK": 5,
            "HKT": 5
          }
        }),
    Question(
        2,
        1,
        QuestionType.ONE_OF_TWO,
        OneOfTwoQuestionPayload('Что выберете?', 'Пицца', 'Суши'),
        {
          0: {"NOR": 3, "EUR": 3},
          1: {"ASI": 3}
        },
        {
          0: {"IT": 5},
          1: {"JP": 5}
        },
        null),
    /*Question(
        3,
        1,
        QuestionType.GRID_MULTIPLE_SELECT,
        GridMultipleSelectPayload('Что вам по душе?', [
          GridItem('Пляжный отдых', null),
          GridItem('Культурный туризм', null),
          GridItem('Гастрономический туризм', null)
        ]),
        null,
        null,
        {
          0: {
            "PAR": 20
          },
          1: {
            "NCE": 20
          },
          2: {
            "MRS": 20
          }
        }),*/
/*    Question(4, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('5 вопрос', 'Да', 'Хз'), null, null, null),
    Question(5, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('6 вопрос', 'Да', 'Хз'), null, null, null),
    Question(6, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('7 вопрос', 'Да', 'Хз'), null, null, null)*/
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Demo',
      home: HomePage(questions: _questions, channel: _channel),
    );
  }
}
