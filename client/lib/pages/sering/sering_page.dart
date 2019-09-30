import 'dart:math';

import 'package:client/api/google/protobuf/empty.pb.dart';
import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/home_page.dart';
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
  QuestionType currentQuestionType;
  QuestWidget currentQuestionCard;
  Question preparedSpecialQuestion;
  bool check = false;

  Future<Question> getSpecialQuestion() async {
    Cities generatedCities;
    QuestionsClient questionsClient = QuestionsClient(widget.channel);
    print(HomePage.token);
    await questionsClient
        .getRandom(HomePage.token)
        .then((resp) => generatedCities = resp);
    return Question(
        -1,
        1,
        QuestionType.ONE_OF_TWO,
        OneOfTwoQuestionPayload(
            'Какой вид вам нравится больше?',
            '',
            Image.network(generatedCities.values[0].photo),
            '',
            Image.network(generatedCities.values[1].photo)),
        null,
        {0: {generatedCities.values[0].countryCode: 1}, 1: {generatedCities.values[0].countryCode: 1}},
        {
          0: {generatedCities.values[0].iata: 2},
          1: {generatedCities.values[1].iata: 2}
        });
  }

  void selectQuestionById(int id) {
    setState(() {
      if (id == -1) {
        this.currentQuestionId = id;
      } else if (widget.questions
              .firstWhere((el) => el.id == id, orElse: () {}) !=
          null) {
        this.currentQuestionId = id;
        this.history.add(id);
      }
    });
  }

  Question getCurrentQuestion() {
    Question question;
    if (this.currentQuestionId == -1) {
      question = this.preparedSpecialQuestion;
    } else {
      question =
          widget.questions.firstWhere((q) => q.id == this.currentQuestionId);
    }
    return question;
  }

  int getNextQuestionId() {
    var questions = this.widget.questions.where((el) =>
        this.history.firstWhere((elem) => elem == el.id, orElse: () {}) ==
        null);
    final _random = new Random();
    if (_random.nextDouble() <= 0.20 && this.history.length > 1) {
      return -1;
    } else
      return questions.length > 0
          ? questions.toList()[_random.nextInt(questions.length)].id
          : -1;
  }

  Future<Cities> finish() async {
    var client = WeightsClient(widget.channel);
    var resultRequest = ResultRequest();
    resultRequest.token = HomePage.token;
    resultRequest.pageSize = 20;
    resultRequest.offset = 0;
    Cities results = await client.result(resultRequest);
    return results;
  }

  void navi(res) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ResultPage(results: res, channel: widget.channel)));
  }

  QuestWidget getCurrentQuestionCard() {
    setState(() {
      if (history.length > 1)
        this
            .getSpecialQuestion()
            .then((resp) => this.preparedSpecialQuestion = resp);
      currentQuestionType = getCurrentQuestion().type;
    });
    switch (currentQuestionType) {
      case QuestionType.YES_DC:
        currentQuestionCard = YesDCQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            getNextQuestionId: getNextQuestionId,
            finish: finish,
            navi: navi,
            channel: widget.channel);
        return currentQuestionCard;

      case QuestionType.ONE_OF_TWO:
        currentQuestionCard = OneOfTwoQuestion(
            question: getCurrentQuestion(),
            selectQuestionById: selectQuestionById,
            getNextQuestionId: getNextQuestionId,
            finish: finish,
            navi: navi,
            channel: widget.channel);
        return currentQuestionCard;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Center(
                    child: _btnConstructor(
                        7, 'Перейти к результатам теста', 'done'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: Container(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Center(
                    child: _btnConstructor(7, 'Пропустить вопрос', 'skip'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                  child: Container(),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.155,
                ),
                Expanded(
                    child: DragHandler(
                        context: context,
                        card: getCurrentQuestionCard(),
                        questionType: currentQuestionType)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.125,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnConstructor(double padding, String text, callback) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.65,
        color: Theme.of(context).buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)),
        child: new Text(text, style: new TextStyle(color: Colors.white)),
        onPressed: () {
          if (callback == 'done') {
            currentQuestionCard.done();
          } else {
            currentQuestionCard.skip();
          }
        },
      ),
    );
  }
}
