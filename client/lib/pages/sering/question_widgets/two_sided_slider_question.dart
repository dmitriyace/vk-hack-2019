import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class TwoSidedSliderQuestion extends StatefulWidget {
  TwoSidedSliderQuestion(
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
  _TwoSidedSliderQuestionState createState() => _TwoSidedSliderQuestionState();
}

class _TwoSidedSliderQuestionState extends State<TwoSidedSliderQuestion> {
  RangeValues model = RangeValues(18.0, 30.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.question.title),
        RangeSlider(
          min: widget.question.payload.min,
          max: widget.question.payload.max,
          values: this.model,
          labels: RangeLabels(this.model.start.toStringAsFixed(0), this.model.end.toStringAsFixed(0)),
          divisions: 68,
          onChanged: (values) {
            setState(() {
              print(values);
              this.model = values;
            });
          },
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
