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
      this.navi,
      this.finish})
      : super(key: key);
  final Question question;
  final Function selectQuestionById;
  final Function getNextQuestionId;
  final Function finish;
  final Function navi;
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
        this.selectQuestionById(id);
    }
  }

  void done() {
    _OneOfTwoQuestionState.model = 0;
    this.finish().then((resp) => this.navi(resp));
  }

  void skip() {
    _OneOfTwoQuestionState.model = 0;
    var id = this.getNextQuestionId();
    if (id == null)
      this.finish().then((resp) => this.navi(resp));
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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(43, 15, 43, 7),
                    child: Text(
                      widget.question.payload.title,
                      style: new TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0, bottom: 8.0),
                  child: GestureDetector(
                    child: Container(
                        width: 220,
                        height: 140,
                        child: ClipRRect(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: widget.question.payload.firstImage,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    onTap: () {
                      _OneOfTwoQuestionState.model = 1;
                      widget.forward();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 26),
                  child: GestureDetector(
                    child: Container(
                        width: 220,
                        height: 140,
                        child: ClipRRect(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: widget.question.payload.secondImage,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    onTap: () {
                      _OneOfTwoQuestionState.model = 2;
                      widget.forward();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
