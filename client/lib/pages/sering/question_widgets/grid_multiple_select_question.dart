import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class GridMultipleSelectQuestion extends StatefulWidget {
  GridMultipleSelectQuestion(
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
  _GridMultipleSelectQuestionState createState() =>
      _GridMultipleSelectQuestionState();
}

class _GridMultipleSelectQuestionState
    extends State<GridMultipleSelectQuestion> {
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
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(widget.question.payload.gridItems.length,
                (index) {
              return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(widget.question.payload.gridItems[index].text),
                  color: Colors.teal[100],
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
            widget.selectQuestionById(widget.getNextQuestionId(), true);
          },
        ),
      ],
    );
  }
}
