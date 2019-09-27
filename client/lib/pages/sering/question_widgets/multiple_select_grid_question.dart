import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class MultipleSelectGridQuestion extends StatefulWidget {
  MultipleSelectGridQuestion(
      {Key key,
      this.question,
      this.selectQuestionById,
      this.channel,
      this.requirements})
      : super(key: key);
  final Question question;
  final Function selectQuestionById;
  final ClientChannel channel;
  final Requirements requirements;

  @override
  _MultipleSelectGridQuestionState createState() =>
      _MultipleSelectGridQuestionState();
}

class _MultipleSelectGridQuestionState
    extends State<MultipleSelectGridQuestion> {
  List<Continent> model = [Continent.AFRICA];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.question.title),
        SizedBox(
          height: 300,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children:
                List.generate(widget.question.payload.gridItemList.length, (i) {
              return Container(
                color: Colors.lightBlueAccent,
                child: Center(
                    child: Text(widget.question.payload.gridItemList[i].title)),
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
        widget.question.isSkippable
            ? RaisedButton(
                child: Text('Скип'),
                onPressed: () {
                  widget.selectQuestionById(widget.question.idNext());
                },
              )
            : Container(),
        RaisedButton(
          child: Text('Вперед'),
          onPressed: () {
            widget.question.payload
                .submitCallback(widget.requirements, this.model, () {
              widget.selectQuestionById(widget.question.idNext(), true);
            });
          },
        ),
      ],
    );
  }
}
