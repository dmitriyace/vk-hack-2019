import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/sering/question_widgets/autocomplete_question.dart';
import 'package:client/pages/sering/question_widgets/multiple_select_grid_question.dart';
import 'package:client/pages/sering/question_widgets/tour_dates_question.dart';
import 'package:client/pages/sering/question_widgets/two_sided_slider_question.dart';
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
  List<int> history = [0];

  void selectQuestionById(int id, bool forward) {
    setState(() {
      if (forward) {
        this.currentQuestionId = id;
        this.history.add(id);
      } else if (this.history.length > 0) {
        this.currentQuestionId = this.history[this.history.length - 2];
        this.history.removeLast();
      }
    });
  }

  Question getCurrentQuestion() =>
      widget.introQuestions.firstWhere((q) => q.id == this.currentQuestionId);

  Widget getCurrentQuestionCard() {
    switch (getCurrentQuestion().type) {
      case QuestionType.AUTOCOMPLETE:
        return AutocompleteQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            channel: widget.channel,
            requirements: requirements);
      case QuestionType.MULTIPLE_SELECT_GRID:
        return MultipleSelectGridQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            channel: widget.channel,
            requirements: requirements);
      case QuestionType.TWO_SIDED_SLIDER:
        return TwoSidedSliderQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            channel: widget.channel,
            requirements: requirements);
      case QuestionType.TOUR_DATES:
        return TourDatesQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            channel: widget.channel,
            requirements: requirements);
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
