import 'package:client/api/search.pb.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key key, this.results}) : super(key: key);
  final Cities results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ListView.builder(
              itemCount: this.results.values.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Center(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Text(this.results.values[index].name)),
                    ],
                  )),
                );
              }),
        ),
      ),
    );
  }
}
