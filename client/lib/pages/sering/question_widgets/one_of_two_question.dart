import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

import '../../home_page.dart';

class OneOfTwoQuestion extends StatefulWidget {
  OneOfTwoQuestion(
      {Key key,
      this.question,
      this.prevQuestion,
      this.selectQuestionById,
      this.channel,
      this.getNextQuestionId,
      this.finish})
      : super(key: key);
  final Question question;
  final Question prevQuestion;
  final Function selectQuestionById;
  final Function getNextQuestionId;
  final Function finish;
  final ClientChannel channel;

  @override
  _OneOfTwoQuestionState createState() => _OneOfTwoQuestionState();

  void forward() async {
    var client = WeightsClient(this.channel);
    if (this.question.continentWeights != null) {
      var delta = ContinentDelta();
      delta.token = HomePage.token;
      this.question.continentWeights[_OneOfTwoQuestionState.model-1].forEach((k, v) {
        var d = Delta.create();
        d.value = v;
        delta.targets[k] = d;
      });
      await client.changeContinent(delta);
    }
    if (this.question.countryWeights != null) {
      var delta = CountryDelta();
      delta.token = HomePage.token;
      this.question.countryWeights[_OneOfTwoQuestionState.model-1].forEach((k, v) {
        var d = Delta.create();
        d.value = v;
        delta.targets[k] = d;
      });
      await client.changeCountry(delta);
    }
    if (this.question.cityWeights != null) {
      var delta = CityDelta();
      delta.token = HomePage.token;
      this.question.cityWeights[_OneOfTwoQuestionState.model-1].forEach((k, v) {
        var d = Delta.create();
        d.value = v;
        delta.targets[k] = d;
      });
      await client.changeCity(delta);
    }
    _OneOfTwoQuestionState.model = 0;
    this.selectQuestionById(this.getNextQuestionId(), true);
  }
  void back() async {
    var client = WeightsClient(this.channel);
    if (this.prevQuestion.continentWeights != null) {
      var delta = ContinentDelta();
      delta.token = HomePage.token;
      this.prevQuestion.continentWeights[0].forEach((k, v) {
        var d = Delta.create();
        d.value = -v;
        delta.targets[k] = d;
      });
      await client.changeContinent(delta);
    }
    if (this.prevQuestion.countryWeights != null) {
      var delta = CountryDelta();
      delta.token = HomePage.token;
      this.prevQuestion.countryWeights[0].forEach((k, v) {
        var d = Delta.create();
        d.value = -v;
        delta.targets[k] = d;
      });
      await client.changeCountry(delta);
    }
    if (this.prevQuestion.cityWeights != null) {
      var delta = CityDelta();
      delta.token = HomePage.token;
      this.prevQuestion.cityWeights[0].forEach((k, v) {
        var d = Delta.create();
        d.value = -v;
        delta.targets[k] = d;
      });
      await client.changeCity(delta);
    }
    _OneOfTwoQuestionState.model = 0;
    this.selectQuestionById(0, false);
  }

  void done() {
    _OneOfTwoQuestionState.model = 0;
    this.finish();
  }

  void skip() {
    _OneOfTwoQuestionState.model = 0;
    this.selectQuestionById(this.getNextQuestionId(), true);
  }
}

class _OneOfTwoQuestionState extends State<OneOfTwoQuestion> {
  static int model = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.question.payload.title),
        GestureDetector(
          onTap: () {
            _OneOfTwoQuestionState.model = 1;
          },
          child: Container(
            width: 200,
            height: 60,
            color: model == 1 ? Colors.lightBlue : Colors.grey,
            child: Center(
              child: Text(widget.question.payload.firstOption),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _OneOfTwoQuestionState.model = 2;
          },
          child: Container(
            width: 200,
            height: 60,
            color: model == 2 ? Colors.lightBlue : Colors.grey,
            child: Center(
              child: Text(widget.question.payload.secondOption),
            ),
          ),
        )
      ],
    );
  }
}
