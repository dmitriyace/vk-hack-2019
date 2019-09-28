import 'package:client/model/question.dart';
import 'package:flutter/material.dart';

abstract class QuestWidget extends Widget {
  void done() {}
  void forward() {}
  void skip() {}

  Question question;
}