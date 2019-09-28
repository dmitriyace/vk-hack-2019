import 'package:flutter/cupertino.dart';

abstract class QuestWidget  extends Widget {
  void done() {}
  void back() {}
  void forward() {}
  void skip() {}
}