import 'package:client/api/search.pb.dart';
import 'package:client/api/search.pbgrpc.dart';
import 'package:client/api/session.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key key, this.results, this.channel}) : super(key: key);
  final Cities results;
  final ClientChannel channel;

  void more(int ps, int os) async {
    var client = WeightsClient(this.channel);
    var resultRequest = ResultRequest();
    resultRequest.token = HomePage.token;
    resultRequest.pageSize = ps;
    resultRequest.offset = os;
    Cities res = await client.result(resultRequest);
    this.results.values.addAll(res.values);
  }

  @override
  Widget build(BuildContext context) {

    SessionClient(channel).close(HomePage.token);

    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Center(
                      child: Text('Вот что нам удалось подобрать:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white)),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      itemCount: this.results.values.length,
                      itemBuilder: (BuildContext context, int index) {
                       /* if (index <= this.results.values.length) {
                          this.more(20, this.results.values.length); *//*4*//*
                        }*/
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                  height: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                    child: FittedBox(
                                      child: FadeInImage(
                                          image: NetworkImage(
                                              this.results.values[index].photo),
                                          placeholder:
                                              AssetImage('images/beach.jpg')),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )),
                              SizedBox(height: 10,),
                              SizedBox(
                                  height: 30,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    ),
                                    child: Center(
                                      child: Text(
                                          "${this.results.values[index].name}, ${this.results.values[index].countryName}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white))
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                                        ),
                                        child: Center(
                                            child: Text(this.results.values[index].flight.price != 0 ? (this.results.values[index].flight.price.toString().length > 4 ? "${this.results.values[index].flight.price.toString().substring(0,2) + ' ' + this.results.values[index].flight.price.toString().substring(2)} ₽" : "${this.results.values[index].flight.price.toString().substring(0,1) + ' ' + this.results.values[index].flight.price.toString().substring(1)} ₽") : "¯\\_(ツ)_/¯", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                                                )),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(child: Container(
                                        margin: EdgeInsets.only(left: 8.0),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                                        ),
                                        child: Center(
                                          child: Text('Забронировать', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white)),
                                        ),
                                      ),onTap: (){launch(this.results.values[index].flight.bookingUrl);},)
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
