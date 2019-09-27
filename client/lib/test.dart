import 'package:client/model/question.dart';

enum LocationScope { CONTINENT, COUNTRY, CITY }

abstract class Question {
  LocationScope scope;
  Map<
      int,
      Map<Location, int>
  > options;
  QuestionPayload payload;
}

/*
Question (
  LocationScope.CONTINENT,
  {
    0:
    {
      Continent.ASIA: 30,
      Continent.EUROPE: -20,
      Continent.NA: -10
    }
    1:
    {
      Continent.ASIA: -20,
      Continent.EUROPE: 30,
      Continent.NA: 10
    }
  }
)


*/

class Location {}

class Continent extends Location {}

class Country extends Location {}

class City extends Location {}
