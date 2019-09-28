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
  static var _channel = ClientChannel('192.168.43.95',
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()));

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
          0: {"CAI": 10}
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
            "LAS": 10,
            "RIO": 10,
            "BCN": 10,
            "NCE": 10,
            "MRS": 10,
            "HER": 10,
            "CAS": 10,
            "TUN": 10,
            "HRG": 10,
            "SSH": 10,
            "AYT": 10,
            "OSA": 10,
            "BKK": 10,
            "HKT": 10
          }
        }),
    Question(2, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('3 вопрос', 'Да', 'Хз'), null, null, null),
    Question(3, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('4 вопрос', 'Да', 'Хз'), null, null, null),
    Question(4, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('5 вопрос', 'Да', 'Хз'), null, null, null),
    Question(5, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('6 вопрос', 'Да', 'Хз'), null, null, null),
    Question(6, 1, QuestionType.YES_DC,
        YesDCQuestionPayload('7 вопрос', 'Да', 'Хз'), null, null, null)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Demo',
      home: HomePage(questions: _questions, channel: _channel),
    );
  }
}
