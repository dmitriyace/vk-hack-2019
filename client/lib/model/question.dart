import 'package:client/api/session.pb.dart';
import 'package:flutter/material.dart';

enum QuestionType {
  AUTOCOMPLETE,
  MULTIPLE_SELECT_GRID,
  INPUT,
  TOUR_DATES,
  MONTH_SELECT,
  LINEUP
}

class Question {
  int id;
  final String title;
  final QuestionType type;
  final Function idNext;
  final bool isSkippable;
  final QuestionPayload payload;
  Question(this.id, this.title, this.type, this.idNext, this.isSkippable, this.payload);
  Question.custom(this.title, this.type, this.idNext, this.isSkippable, this.payload);
}

abstract class QuestionPayload {
  int maxIntervalDays;
  List<GridItem> gridItemList;
  List<Month> monthItemList;
  Function suggestionsCallback;
  Function submitCallback;
}
class EmptyQuestionPayload extends QuestionPayload {
  final Function submitCallback;
  EmptyQuestionPayload(this.submitCallback);
}
class AutocompleteQuestionPayload extends QuestionPayload {
  final Function suggestionsCallback;
  final Function submitCallback;
  AutocompleteQuestionPayload(this.suggestionsCallback, this.submitCallback);
}
class MultipleSelectGridPayload extends QuestionPayload {
  final List<GridItem> gridItemList;
  final Function submitCallback;
  MultipleSelectGridPayload(this.gridItemList, this.submitCallback);
}
class TourDatesPayload extends QuestionPayload {
  final int maxIntervalDays;
  final Function submitCallback;
  TourDatesPayload(this.maxIntervalDays, this.submitCallback);
}
class MonthSelectQuestionPayload extends QuestionPayload {
  final List<Month> monthItemList;
  final Function submitCallback;
  MonthSelectQuestionPayload(this.monthItemList, this.submitCallback);
}

class GridItem {
  final String title;
  final Image img;
  GridItem(this.title, this.img);
}