import 'package:client/pages/home_page.dart';
import 'package:client/pages/sering/question_widgets/yes_dc_question.dart';
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
    Question(0, 1, QuestionType.YES_DC, YesDCQuestionPayload('1 вопрос', 'Да', 'Хз'), null, null, null),
    Question(1, 1, QuestionType.YES_DC, YesDCQuestionPayload('2 вопрос', 'Да', 'Хз'), null, null, null),
    Question(2, 1, QuestionType.YES_DC, YesDCQuestionPayload('3 вопрос', 'Да', 'Хз'), null, null, null),
    Question(3, 1, QuestionType.YES_DC, YesDCQuestionPayload('4 вопрос', 'Да', 'Хз'), null, null, null),
    Question(4, 1, QuestionType.YES_DC, YesDCQuestionPayload('5 вопрос', 'Да', 'Хз'), null, null, null),
    Question(5, 1, QuestionType.YES_DC, YesDCQuestionPayload('6 вопрос', 'Да', 'Хз'), null, null, null),
    Question(6, 1, QuestionType.YES_DC, YesDCQuestionPayload('7 вопрос', 'Да', 'Хз'), null, null, null)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Demo',
      home: HomePage(
          questions: _questions,
          channel: _channel),
    );
  }
}
