import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';
import 'quest_widget.dart';

import '../../home_page.dart';

class OneOfTwoQuestion extends StatefulWidget implements QuestWidget {
  OneOfTwoQuestion(
      {Key key,
      this.question,
      this.selectQuestionById,
      this.channel,
      this.getNextQuestionId,
      this.finish})
      : super(key: key);
  final Question question;
  final Function selectQuestionById;
  final Function getNextQuestionId;
  final Function finish;
  final ClientChannel channel;

  @override
  _OneOfTwoQuestionState createState() => _OneOfTwoQuestionState();

  void forward() async {
    if (_OneOfTwoQuestionState.model == 0) {
      _OneOfTwoQuestionState.model = 0;
      var id = this.getNextQuestionId();
      if (id == null)
        this.finish();
      else
        this.selectQuestionById(id);
    } else {
      var client = WeightsClient(this.channel);
      if (this.question.continentWeights != null) {
        var delta = ContinentDelta();
        delta.token = HomePage.token;
        this
            .question
            .continentWeights[_OneOfTwoQuestionState.model - 1]
            .forEach((k, v) {
          var d = Delta.create();
          d.value = v;
          delta.targets[k] = d;
        });
        await client.changeContinent(delta);
      }
      if (this.question.countryWeights != null) {
        var delta = CountryDelta();
        delta.token = HomePage.token;
        this
            .question
            .countryWeights[_OneOfTwoQuestionState.model - 1]
            .forEach((k, v) {
          var d = Delta.create();
          d.value = v;
          delta.targets[k] = d;
        });
        await client.changeCountry(delta);
      }
      if (this.question.cityWeights != null) {
        var delta = CityDelta();
        delta.token = HomePage.token;
        this
            .question
            .cityWeights[_OneOfTwoQuestionState.model - 1]
            .forEach((k, v) {
          var d = Delta.create();
          d.value = v;
          delta.targets[k] = d;
        });
        await client.changeCity(delta);
      }
      _OneOfTwoQuestionState.model = 0;
      var id = this.getNextQuestionId();
      if (id == null)
        this.finish();
      else
        this.selectQuestionById(id, true);
    }
  }

  void done() {
    _OneOfTwoQuestionState.model = 0;
    this.finish();
  }

  void skip() {
    _OneOfTwoQuestionState.model = 0;
    var id = this.getNextQuestionId();
    if (id == null)
      this.finish();
    else
      this.selectQuestionById(id);
  }

  @override
  void set question(Question _question) {
    this.question = _question;
  }
}

class _OneOfTwoQuestionState extends State<OneOfTwoQuestion> {
  static int model = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
            Radius.circular(15.0)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Text(widget.question.payload.title),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      width: 90,
                      height: 160,
                      child: Stack(
                        children: <Widget>[
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                      widget.question.payload.firstImage))),
                          Text(widget.question.payload.firstOption)
                        ],
                      ),
                    ),
                    onTap: () {
                      // todo handle answer
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 90,
                      height: 160,
                      child: Stack(
                        children: <Widget>[
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                      widget.question.payload.secondImage))),
                          Text(widget.question.payload.secondOption)
                        ],
                      ),
                    ),
                    onTap: () {
                      // todo handle answer
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
