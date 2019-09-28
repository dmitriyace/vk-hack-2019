import 'package:client/api/autocomplete.pb.dart';
import 'package:client/api/session.pb.dart';

enum LocationScope { CONTINENT, COUNTRY, CITY }
enum QuestionType {
  YES_DC,
  MULTIPLE_SELECT
}

abstract class Question {
  int id;
  int tier;
  QuestionType type;
  QuestionPayload payload;
  LocationScope scope;
  Map<
      int,
      Map<Continent, int>
  > continentWeights;
  Map<
      int,
      Map<Country, int>
  > countryWeights;
  Map<
      int,
      Map<City, int>
  > cityWeights;
}

abstract class QuestionPayload {
  String title;
}

class YesDCQuestionPayload extends QuestionPayload {
  String yesOption;
  String dCOption;
}

class MultipleSelectQuestionPayload extends QuestionPayload {

}