import 'dart:math';

import 'package:client/api/google/protobuf/empty.pb.dart';
import 'package:client/api/session.pbgrpc.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/sering/sering_page.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.questions, this.channel}) : super(key: key);

  final ClientChannel channel;
  final List<Question> questions;
  static int firstQuestion;
  static Token token;

  void createSessionClient() {
    SessionClient(this.channel)
        .open(Empty())
        .then((resp) => HomePage.token = resp);
  }

  // todo move this function to final screen
  _launchURL() async {
    const url =
        'https://www.aviasales.ru/search?origin=LED&destination=NYC&depart_date=2019-10-01';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        body: Center(
          child: Container(
            width: 224,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 43,
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        this.createSessionClient();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              HomePage.firstQuestion = new Random().nextInt(3);
                              return SeringPage(
                                  questions: questions, channel: channel);
                            }));
                      },
                      child: Padding(padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Подобрать тур?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      textColor: Theme
                          .of(context)
                          .primaryTextTheme
                          .title
                          .color,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),)
              ],
            ),)
          ,
        )
    );
  }
}
