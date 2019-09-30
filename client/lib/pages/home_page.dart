import 'dart:math';

import 'package:client/api/google/protobuf/empty.pb.dart';
import 'package:client/api/search.pb.dart';
import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pbgrpc.dart';
import 'package:client/model/question.dart';
import 'package:client/pages/sering/sering_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        .then((resp) {HomePage.token = resp;
    var delta = CityDelta();
    var client = WeightsClient(this.channel);
    delta.token = HomePage.token;
    Map<String, int> tete = {"AGR":2, "AMS":2, "ATH":2, "AYT":2, "BCN":2, "BER":2, "BKK":2, "BOM":2, "CAI":2, "CAN":2, "CUN":2,"DEL":2, "DPS":2, "DUB":2, "DXB":2, "FLR":2, "HKG":2, "HKT":2, "IST":2, "JAI":2, "JHB":2, "JNB":2, "KUL":2, "LAS":2, "LAX":2, "LON":2,"MAA":2, "MAD":2, "MFM":2, "MIA":2, "MIL":2, "MOW":2, "NYC":2, "ORL":2, "OSA":2, "PAR":2, "PRG":2, "ROM":2, "RUH":2, "SEL":2, "SHA":2,"SIN":2, "TPE":2, "TYO":2, "UTP":2, "VCE":2, "VIE":2};
    tete.forEach((k, v) {
      var d = Delta.create();
      d.value = v;
      delta.targets[k] = d;

    });

    client.changeCity(delta);});
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
