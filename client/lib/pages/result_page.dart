import 'package:client/api/search.pb.dart';
import 'package:client/api/search.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

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
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text(
                    'Вот что нам удалось подобрать:'
                  ),
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int i) {
                      final index = i ~/ 2;
                      if (i.isOdd)
                        return Container(
                          child: Center(
                            child: Text(this.results.values[index].name),
                          ),
                        );


                      if (index <= this.results.values.length-1) {
                        this.more(20, this.results.values.length); /*4*/
                      }
                      return Card(
                          child: FadeInImage(image: NetworkImage(this.results.values[index].photo), placeholder: AssetImage('images/beach.jpg'),)
                      );
                    }),
              )

            ],
          )
        ),
      ),
    );
  }
}
