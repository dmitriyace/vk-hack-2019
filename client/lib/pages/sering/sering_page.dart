import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/sering/question_widgets/yes_dc_question.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class SeringPage extends StatefulWidget {
  SeringPage({Key key, this.questions, this.channel}) : super(key: key);
  final List<Question> questions;
  final ClientChannel channel;

  _SeringPageState createState() => _SeringPageState();
}

class _SeringPageState extends State<SeringPage> {
  List<int> history = [];
  int currentQuestionId = 0;
  Requirements requirements = Requirements();

  void selectQuestionById(int id, bool forward) {
    setState(() {
      if (forward) {
        this.currentQuestionId = id;
        this.history.add(id);
      } else {
        this.currentQuestionId = this.history[this.history.length - 2];
        this.history.removeLast();
      }
    });
  }

  Question getCurrentQuestion() =>
      widget.questions.firstWhere((q) => q.id == this.currentQuestionId);

  int getNextQuestionId() => widget.questions
      .where((el) => this.history.firstWhere((elem) => elem == el.id) == null)
      .first
      .id;

  Widget getCurrentQuestionCard() {
    switch (getCurrentQuestion().type) {
      case QuestionType.YES_DC:
        return YesDCQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            getNextQuestionId: getNextQuestionId,
            channel: widget.channel);
      default:
        return Text('default');
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
              child: getCurrentQuestionCard(),
            )
          ],
        ),
      )),
    );
  }
}
