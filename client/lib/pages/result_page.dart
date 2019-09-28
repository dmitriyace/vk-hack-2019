import 'package:client/api/search.pb.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget  {
  ResultPage({Key key, this.results}) : super(key: key);
  final Cities results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Container(
          width: 200,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: this.results.values.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: Center(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Text(this.results.values[index].name)),
                      RaisedButton(
                        child: Text('Перейти'),
                        onPressed: null,
                      )
                    ],
                  )),
                );
              }
          ),
        ),)
    );
  }
}
