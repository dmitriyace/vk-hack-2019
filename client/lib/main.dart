import 'package:client/api/session.pbgrpc.dart';
import 'package:client/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static var _channel = ClientChannel('5.63.153.29',
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
            "BR": 1,
            "ES": 1,
            "FR": 1,
            "IT": 1,
            "GR": 1,
            "MA": 1,
            "TN": 1,
            "EG": 1,
            "TR": 1,
            "JP": 1,
            "TH": 1
          }
        },
        {
          0: {
            "LAS": 1,
            "RIO": 1,
            "BCN": 1,
            "NCE": 1,
            "MRS": 1,
            "HER": 1,
            "CAS": 1,
            "TUN": 1,
            "HRG": 1,
            "SSH": 1,
            "AYT": 1,
            "OSA": 1,
            "BKK": 1,
            "HKT": 1
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
          0: {"IT": 1},
          1: {"JP": 1}
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
          Image.asset('images/visa.jpg')),
      null,
      {
        0: {
          "BR": 4,
          "HK": 4,
          "MA": 4,
          "TH": 4,
          "TR": 4,
          "TN": 4,
          "KR": 4,
          "EG": 4
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
    Question(
        7,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload(
            'Какие эмоции вы испытываете в мегаполисе?',
            'Обожаю суету',
            'Предпочитаю уединение',
            Image.asset('images/traffic.jpg')),
        null,
        null,
        null),
    Question(
        8,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload('Как на счет баров?', 'Совсем не прочь',
            'Бары явно не для меня', Image.asset('images/bar.jpg')),
        null,
        null,
        null),
    Question(
        9,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload(
            'Вам бы хотелось познакомиться с коренными жителями города?',
            'Абсолютно точно!',
            'На улице не знакомлюсь.',
            Image.asset('images/meeting.jpg')),
        null,
        null,
        null),
    Question(
        10,
        1,
        QuestionType.YES_DC,
        YesDCQuestionPayload(
            'Вы любите бродить по узким улочкам?',
            'Идеальное приключение - заплутать в них.',
            'Люблю широкие проспекты!',
            Image.asset('images/street.jpg')),
        null,
        null,
        null),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
