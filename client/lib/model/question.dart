import 'package:client/api/search.pb.dart';
import 'package:client/api/session.pb.dart';

enum QuestionType {
  YES_DC,
  ONE_OF_TWO,
  MULTIPLE_SELECT
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
}

class YesDCQuestionPayload extends QuestionPayload {
  String title;
  String yesOption;
  String dCOption;
  YesDCQuestionPayload(this.title, this.yesOption, this.dCOption);
}

class OneOfTwoQuestionPayload extends QuestionPayload {
  String title;
  String firstOption;
  String secondOption;
  OneOfTwoQuestionPayload(this.title, this.firstOption, this.secondOption);
}

class MultipleSelectQuestionPayload extends QuestionPayload {

}