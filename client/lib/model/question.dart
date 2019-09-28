import 'package:client/api/search.pb.dart';
import 'package:client/api/session.pb.dart';
import 'package:flutter/cupertino.dart';

enum QuestionType {
  YES_DC,
  ONE_OF_TWO,
  GRID_MULTIPLE_SELECT
}

class Question {
  int id;
  int tier;
  QuestionType type;
  QuestionPayload payload;
  Map<
      int,
      Map<String, int>
  > continentWeights;
  Map<
      int,
      Map<String, int>
  > countryWeights;
  Map<
      int,
      Map<String, int>
  > cityWeights;
  Question(this.id, this.tier, this.type, this.payload, this. continentWeights, this.countryWeights, this.cityWeights);
}

abstract class QuestionPayload {
  String title;
  String yesOption;
  String dCOption;
  String firstOption;
  String secondOption;
  AssetImage firstImage;
  AssetImage secondImage;
  AssetImage image;
  List<GridItem> gridItems;
}

class YesDCQuestionPayload extends QuestionPayload {
  String title;
  String yesOption;
  String dCOption;
  AssetImage image;
  YesDCQuestionPayload(this.title, this.yesOption, this.dCOption, this.image);
}

class OneOfTwoQuestionPayload extends QuestionPayload {
  String title;
  String firstOption;
  AssetImage firstImage;
  String secondOption;
  AssetImage secondImage;
  OneOfTwoQuestionPayload(this.title, this.firstOption, this.firstImage, this.secondOption, this.secondImage);
}

class GridMultipleSelectPayload extends QuestionPayload {
  String title;
  List<GridItem> gridItems;
  GridMultipleSelectPayload(this.title, this.gridItems);
}

class GridItem {
  String text;
  String img;
  GridItem(this.text, this.img);
}

class MultipleSelectQuestionPayload extends QuestionPayload {

}