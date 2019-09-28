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
  void back() {
    // TODO: implement back
  }

  @override
  void done() {
    // TODO: implement done
  }

  @override
  void forward() {
    // TODO: implement forward
  }

  @override
  void skip() {
    // TODO: implement skip
  }
}

class _YesDCQuestionState extends State<YesDCQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          child: Text('Завершить'),
          onPressed: () {
            widget.finish();
          },
        ),
        Text(widget.question.payload.title),
        RaisedButton(
          child: Text(widget.question.payload.yesOption),
          onPressed: () async {
            var client = WeightsClient(widget.channel);
            if (widget.question.continentWeights != null) {
              var delta = ContinentDelta();
              delta.token = HomePage.token;
              widget.question.continentWeights[0].forEach((k, v) {
                var d = Delta.create();
                d.value = v;
                delta.targets[k] = d;
              });
              await client.changeContinent(delta);
            }
            if (widget.question.countryWeights != null) {
              var delta = CountryDelta();
              delta.token = HomePage.token;
              widget.question.countryWeights[0].forEach((k, v) {
                var d = Delta.create();
                d.value = v;
                delta.targets[k] = d;
              });
              await client.changeCountry(delta);
            }
            if (widget.question.cityWeights != null) {
              var delta = CityDelta();
              delta.token = HomePage.token;
              widget.question.cityWeights[0].forEach((k, v) {
                var d = Delta.create();
                d.value = v;
                delta.targets[k] = d;
              });
              await client.changeCity(delta);
            }
            widget.selectQuestionById(widget.getNextQuestionId(), true);
          },
        ),
        RaisedButton(
          child: Text(widget.question.payload.dCOption),
          onPressed: () {
            widget.selectQuestionById(widget.getNextQuestionId(), true);
          },
        ),
        RaisedButton(
          child: Text('Назад'),
          onPressed: () async {
            var client = WeightsClient(widget.channel);
            if (widget.prevQuestion.continentWeights != null) {
              var delta = ContinentDelta();
              delta.token = HomePage.token;
              widget.prevQuestion.continentWeights[0].forEach((k, v) {
                var d = Delta.create();
                d.value = -v;
                delta.targets[k] = d;
              });
              await client.changeContinent(delta);
            }
            if (widget.prevQuestion.countryWeights != null) {
              var delta = CountryDelta();
              delta.token = HomePage.token;
              widget.prevQuestion.countryWeights[0].forEach((k, v) {
                var d = Delta.create();
                d.value = -v;
                delta.targets[k] = d;
              });
              await client.changeCountry(delta);
            }
            if (widget.prevQuestion.cityWeights != null) {
              var delta = CityDelta();
              delta.token = HomePage.token;
              widget.prevQuestion.cityWeights[0].forEach((k, v) {
                var d = Delta.create();
                d.value = -v;
                delta.targets[k] = d;
              });
              await client.changeCity(delta);
            }
            widget.selectQuestionById(0, false);
          },
        ),
        RaisedButton(
          child: Text('Скип'),
          onPressed: () {
            widget.selectQuestionById(widget.getNextQuestionId(), true);
          },
        ),
      ],
    );
  }
}
