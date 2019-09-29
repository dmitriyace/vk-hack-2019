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
    return Card(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.83,
//        height: MediaQuery.of(context).size.height * 1,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(43, 60, 43, 30),
              child: Text(
                widget.question.payload.title,
                style: new TextStyle(fontSize: 20),
              ),
            )),
            Center(
              child: SizedBox(
                height: 300,
                child: Center(
                  child: Column(children: <Widget>[
                    _btnBuilder(43.0, widget.question.payload.yesOption, 18.0),
                    _btnBuilder(43.0, widget.question.payload.dCOption, 18.0),
                    Center(
                      child: Container(
                        height: 160,
                        child: Card(
                          child: widget.question.payload.image,
                          elevation: 10,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _btnBuilder(height, text, fontSize) {
    return MaterialButton(
      minWidth: 200,
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          text,
          style: new TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
      onPressed: () {
        setState(() {
          _YesDCQuestionState.model = false;
          widget.forward();
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(15.0),
      ),
    );
  }
}
