import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/sering/question_widgets/autocomplete_question.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class SeringPage extends StatefulWidget {
  SeringPage({Key key, this.introQuestions, this.channel}) : super(key: key);
  final List<Question> introQuestions;
  final ClientChannel channel;

  _SeringPageState createState() => _SeringPageState();
}

class _SeringPageState extends State<SeringPage> {
  bool intro = true;
  int currentQuestionId = 0;
  Requirements requirements = Requirements();

  void selectQuestionById(int id) {
    setState(() {
      this.currentQuestionId = id;
    });
  }

  Question getCurrentQuestion() =>
      widget.introQuestions.firstWhere((q) => q.id == this.currentQuestionId);

  Widget getCurrentQuestionCard() {
    switch (getCurrentQuestion().type) {
      case QuestionType.AUTOCOMPLETE: return AutocompleteQuestion(question: getCurrentQuestion(), selectQuestionById: selectQuestionById, channel: widget.channel, requirements: requirements);
      default: return Text('default');
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
