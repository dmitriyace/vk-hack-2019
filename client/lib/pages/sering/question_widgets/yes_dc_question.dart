import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/home_page.dart';
import 'package:client/pages/sering/question_widgets/quest_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class YesDCQuestion extends StatefulWidget implements QuestWidget {
  YesDCQuestion(
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
  _YesDCQuestionState createState() => _YesDCQuestionState();

  @override
  void forward() async {
    var client = WeightsClient(this.channel);
    if (this.question.continentWeights != null) {
      var delta = ContinentDelta();
      delta.token = HomePage.token;
      this.question.continentWeights[0].forEach((k, v) {
        var d = Delta.create();
        d.value = v;
        delta.targets[k] = d;
      });
      await client.changeContinent(delta);
    }
    if (this.question.countryWeights != null) {
      var delta = CountryDelta();
      delta.token = HomePage.token;
      this.question.countryWeights[0].forEach((k, v) {
        var d = Delta.create();
        d.value = v;
        delta.targets[k] = d;
      });
      await client.changeCountry(delta);
    }
    if (this.question.cityWeights != null) {
      var delta = CityDelta();
      delta.token = HomePage.token;
      this.question.cityWeights[0].forEach((k, v) {
        var d = Delta.create();
        d.value = v;
        delta.targets[k] = d;
      });
      await client.changeCity(delta);
    }
    this.selectQuestionById(this.getNextQuestionId(), true);
  }

  void done() {
    _YesDCQuestionState.model = false;
    this.finish();
  }

  void skip() {
    _YesDCQuestionState.model = false;
    this.selectQuestionById(this.getNextQuestionId(), true);
  }

  @override
  void back() async {
    if (_YesDCQuestionState.model) {
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
      this.selectQuestionById(0, false);
    } else {
      this.selectQuestionById(this.getNextQuestionId(), true);
    }
  }
}

class _YesDCQuestionState extends State<YesDCQuestion> {
  static bool model = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.question.payload.title),
        GestureDetector(
          onTap: () {
            setState(() {
              _YesDCQuestionState.model = !_YesDCQuestionState.model;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: _YesDCQuestionState.model ? Colors.blue : Colors.grey,
            child: Center(
                child: Text(
              _YesDCQuestionState.model
                  ? widget.question.payload.secondOption
                  : widget.question.payload.firstOption,
            )),
          ),
        ),
      ],
    );
  }
}
