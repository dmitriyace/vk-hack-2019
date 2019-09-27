import 'package:client/api/session.pb.dart';
import 'package:client/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grpc/grpc.dart';

class AutocompleteQuestion extends StatefulWidget {
  AutocompleteQuestion(
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
  _AutocompleteQuestionState createState() => _AutocompleteQuestionState();
}

class _AutocompleteQuestionState extends State<AutocompleteQuestion> {
  String model = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.question.title),
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(border: OutlineInputBorder())),
          suggestionsCallback: widget.question.payload.suggestionsCallback,
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.name),
              subtitle: Text('roflan${suggestion.name}'),
            );
          },
          onSuggestionSelected: (suggestion) {
            this.model = suggestion.name;
          },
        ),
        RaisedButton(
          child: Text('Назад'),
          onPressed: null,
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
              widget.selectQuestionById(widget.question.idNext());
            });
          },
        ),
      ],
    );
  }
}
