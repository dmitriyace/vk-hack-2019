import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

import '../../home_page.dart';

class GridMultipleSelectQuestion extends StatefulWidget {
  GridMultipleSelectQuestion(
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
  _GridMultipleSelectQuestionState createState() =>
      _GridMultipleSelectQuestionState();
}

class _GridMultipleSelectQuestionState
    extends State<GridMultipleSelectQuestion> {

  List<bool> model = null;

  @override
  Widget build(BuildContext context) {
    if (this.model == null) this.model = List<bool>.generate(widget.question.payload.gridItems.length, (el) => false);
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
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(widget.question.payload.gridItems.length,
                (index) {
              return GestureDetector(
                  onTap: () {setState(() {
                    this.model[index] = !this.model[index];
                  });},
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(widget.question.payload.gridItems[index].text),
                      color: this.model[index] ? Colors.teal[100] : Colors.black38
                  ),
              );
            }),
          ),
        ),
        RaisedButton(
          child: Text('Назад'),
          onPressed: () {
            widget.selectQuestionById(0, false);
          },
        ),
        RaisedButton(
          child: Text('Скип'),
          onPressed: () {
            widget.selectQuestionById(widget.getNextQuestionId(), true);
          },
        ),
        RaisedButton(
          child: Text('Вперед'),
          onPressed: () {
            var client = WeightsClient(widget.channel);
            this.model.asMap().forEach((ind, el) async {
              if (el) {
                if (widget.question.continentWeights != null) {
                  var delta = ContinentDelta();
                  delta.token = HomePage.token;
                  widget.question.continentWeights[ind].forEach((k, v) {
                    var d = Delta.create();
                    d.value = v;
                    delta.targets[k] = d;
                  });
                  await client.changeContinent(delta);
                }
                if (widget.question.countryWeights != null) {
                  var delta = CountryDelta();
                  delta.token = HomePage.token;
                  widget.question.countryWeights[ind].forEach((k, v) {
                    var d = Delta.create();
                    d.value = v;
                    delta.targets[k] = d;
                  });
                  await client.changeCountry(delta);
                }
                if (widget.question.cityWeights != null) {
                  var delta = CityDelta();
                  delta.token = HomePage.token;
                  widget.question.cityWeights[ind].forEach((k, v) {
                    var d = Delta.create();
                    d.value = v;
                    delta.targets[k] = d;
                  });
                  await client.changeCity(delta);
                }
              }
            });
            widget.selectQuestionById(widget.getNextQuestionId(), true);
          },
        ),
      ],
    );
  }
}
