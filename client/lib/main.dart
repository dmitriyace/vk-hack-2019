import 'package:client/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'api/autocomplete.pb.dart';
import 'api/autocomplete.pbgrpc.dart';
import 'api/session.pb.dart';
import 'model/question.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _GlobalParent();
  }
}

class _GlobalParent extends StatefulWidget {
  @override
  _GlobalParentState createState() => _GlobalParentState();
}

class _GlobalParentState extends State<_GlobalParent> {
  static var _channel = ClientChannel('192.168.43.95',
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()));

  List<Question> _questions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Demo',
      home: HomePage(
          questions: _questions,
          channel: _channel),
    );
  }
}
