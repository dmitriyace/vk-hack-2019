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
  _YesDCQuestionState createState() => _YesDCQuestionState();

  void done() {
    _YesDCQuestionState.model = false;
    this.finish();
  }

  void skip() {
    _YesDCQuestionState.model = false;
    var id = this.getNextQuestionId();
    if (id == null)
      this.finish();
    else
      this.selectQuestionById(id);
  }

  @override
  void forward() async {
    if (_YesDCQuestionState.model) {
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
      var id = this.getNextQuestionId();
      if (id == null)
        this.finish();
      else
        this.selectQuestionById(id);
      _YesDCQuestionState.model = false;
    } else {
      _YesDCQuestionState.model = false;
      var id = this.getNextQuestionId();
      if (id == null)
        this.finish();
      else
        this.selectQuestionById(id);
    }
  }

  @override
  void set question(Question _question) {
    this.question = _question;
  }
}

class _YesDCQuestionState extends State<YesDCQuestion> {
  static bool model = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
            Radius.circular(15.0) //         <--- border radius here
        ),
      ),
      child: Column(
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
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  MaterialButton(
                    height: 35,
                    color: Colors.green,
                    child: new Text(widget.question.payload.yesOption,
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white)),
                    onPressed: () {
                      // todo handle answer logic
                    },
                  ),
                  MaterialButton(
                    height: 35,
                    color: Colors.grey,
                    child: new Text(widget.question.payload.dCOption,
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white)),
                    onPressed: () {
                      // todo handle answer logic
                    },
                  )
                ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
