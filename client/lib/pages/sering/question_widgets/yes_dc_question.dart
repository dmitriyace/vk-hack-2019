import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class YesDCQuestion extends StatefulWidget {
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
          onPressed: () {
            //todo
          },
        ),
        RaisedButton(
          child: Text(widget.question.payload.dCOption),
          onPressed: () {
            //todo
          },
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
