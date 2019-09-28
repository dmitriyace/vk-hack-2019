import 'dart:math';

import 'package:client/api/google/protobuf/empty.pb.dart';
import 'package:client/api/session.pbgrpc.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/sering/sering_page.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.questions, this.channel}) : super(key: key);

  final ClientChannel channel;
  final List<Question> questions;
  static int firstQuestion;
  static Token token;

  void createSessionClient() {
    SessionClient(this.channel).open(Empty()).then(
            (resp) => HomePage.token = resp
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(onPressed: () {
                this.createSessionClient();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      HomePage.firstQuestion = new Random().nextInt(3);
                      return SeringPage(questions: questions, channel: channel);}
                ));
              }, child: Text('Начать'))
            ],
          ),
        ),)
    );
  }
}
