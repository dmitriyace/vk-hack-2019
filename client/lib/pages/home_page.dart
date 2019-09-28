import 'package:client/model/question.dart';
import 'package:client/pages/sering/sering_page.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.questions, this.channel}) : super(key: key);

  final ClientChannel channel;
  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
/*              hasHistory
                  ? RaisedButton(
                onPressed: null,
                child: Text('История поисков'),
              )
                  : Container(),*/
              RaisedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SeringPage(questions: questions, channel: channel)
                ));
              }, child: Text('Начать'))
            ],
          ),
        ),)
    );
  }
}
