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
            'Без разницы',
            Image.asset('images/giza.jpg')),
        null,
        null,
        {
          0: {"CAI": 3}
        }),
    Question(
        1,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload('Как насчет искупаться в теплом море?',
            'Определенно.', 'Не важно', Image.asset('images/beach.jpg')),
        null,
        {
          0: {
            "BR": 3,
            "ES": 3,
            "FR": 3,
            "IT": 3,
            "GR": 3,
            "MA": 3,
            "TN": 3,
            "EG": 3,
            "TR": 3,
            "JP": 3,
            "TH": 3
          }
        },
        {
          0: {
            "LAS": 2,
            "RIO": 2,
            "BCN": 2,
            "NCE": 2,
            "MRS": 2,
            "HER": 2,
            "CAS": 2,
            "TUN": 2,
            "HRG": 2,
            "SSH": 2,
            "AYT": 2,
            "OSA": 2,
            "BKK": 2,
            "HKT": 2
          }
        }),
    Question(
        2,
        1,
        QuestionType.ONE_OF_TWO,
        OneOfTwoQuestionPayload(
            'Что выберете?',
            'Пицца',
            Image.asset('images/pizza.jpg'),
            'Суши',
            Image.asset('images/sushi.jpg')),
        {
          0: {"NOR": 1, "EUR": 1},
          1: {"ASI": 1}
        },
        {
          0: {"IT": 3},
          1: {"JP": 3}
        },
        null),
    Question(
      3,
      1,
      QuestionType.YES_DC,
      YesDCQuestionPayload(
          'Хотите избежать процесс получения визы?',
          'Да, мое время - на вес золота',
          'Не волнует',
          Image.asset('image/visa.jpg')),
      null,
      {
        0: {
          "BR": 2,
          "HK": 2,
          "MA": 2,
          "TH": 2,
          "TR": 2,
          "TN": 2,
          "KR": 2,
          "EG": 1
        }
      },
      null,
    ),
    Question(
        4,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload('Горные пейзажи завораживают вас до глубины души',
            'О, да', 'Ничего особенного', Image.asset('images/mountains.jpg')),
        null,
        null,
        null),
    Question(
        5,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload('Вы - настоящий ценитель Высокого', 'Именно так.',
            'Не особо', Image.asset('images/sculpture.jpg')),
        null,
        null,
        null),
    Question(
        6,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload('Экзотика вас не пугает, а напротив', 'Так и есть',
            'Только не насекомые!', Image.asset('images/venus.jpg')),
        {
          0: {"ASI": 1}
        },
        null,
        null),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Demo',
      theme: ThemeData(
        backgroundColor: Color(0xff4494EC),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        buttonColor: Color(0xffE68130),
      ),
      home: HomePage(questions: _questions, channel: _channel),
    );
  }
}
