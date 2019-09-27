import 'package:client/api/google/protobuf/timestamp.pb.dart';
import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class TourDatesQuestion extends StatefulWidget {
  TourDatesQuestion(
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
  _TourDatesQuestionState createState() => _TourDatesQuestionState();
}

class _TourDatesQuestionState extends State<TourDatesQuestion> {
  Timestamp model = Timestamp.fromDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.question.title),
        MonthPicker(selectedDate: DateTime.now(), onChanged: (f){}, firstDate: DateTime(2013), lastDate: DateTime(2019)),
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
