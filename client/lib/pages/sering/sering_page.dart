import 'dart:math';

import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/home_page.dart';
import 'package:client/pages/sering/question_widgets/grid_multiple_select_question.dart';
import 'package:client/pages/sering/question_widgets/one_of_two_question.dart';
import 'package:client/pages/sering/question_widgets/quest_widget.dart';
import 'package:client/pages/sering/question_widgets/yes_dc_question.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:client/components/drag_handler.dart';
import '../result_page.dart';

class SeringPage extends StatefulWidget {
  SeringPage({Key key, this.questions, this.channel}) : super(key: key);
  final List<Question> questions;
  final ClientChannel channel;

  _SeringPageState createState() => _SeringPageState();
}

class _SeringPageState extends State<SeringPage> {
  List<int> history = [HomePage.firstQuestion];
  int currentQuestionId = HomePage.firstQuestion;

  void selectQuestionById(int id) {
    setState(() {
      if (widget.questions.firstWhere((el) => el.id == id, orElse: () {}) !=
          null) {
        this.currentQuestionId = id;
        this.history.add(id);
      }
    });
  }

  Question getCurrentQuestion() =>
      widget.questions.firstWhere((q) => q.id == this.currentQuestionId);

  int getNextQuestionId() {
    var questions = this.widget.questions.where((el) =>
        this.history.firstWhere((elem) => elem == el.id, orElse: () {}) ==
        null);
    final _random = new Random();

    return questions.length > 0
        ? questions.toList()[_random.nextInt(questions.length)].id
        : null;
  }

  void finish() async {
    var client = WeightsClient(widget.channel);
    var resultRequest = ResultRequest();
    resultRequest.token = HomePage.token;
    resultRequest.pageSize = 5;
    resultRequest.offset = 0;
    Cities results = await client.result(resultRequest);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ResultPage(results: results)));
  }

  QuestWidget getCurrentQuestionCard() {
    switch (getCurrentQuestion().type) {
      case QuestionType.YES_DC:
        return YesDCQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            getNextQuestionId: getNextQuestionId,
            finish: finish,
            channel: widget.channel);
      case QuestionType.ONE_OF_TWO:
        return OneOfTwoQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            getNextQuestionId: getNextQuestionId,
            finish: finish,
            channel: widget.channel);
/*      case QuestionType.GRID_MULTIPLE_SELECT:
        return GridMultipleSelectQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            getNextQuestionId: getNextQuestionId,
            finish: finish,
            channel: widget.channel);*/
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30.0),
              width: 150.0,
              height: 20.0,
              color: Colors.black38,
            ),
            Expanded(
                child: DragHandler(
                    context: context,
                    card: getCurrentQuestionCard()))
          ],
        ),
      )),
    );
  }
}
