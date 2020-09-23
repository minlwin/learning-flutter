import 'package:f02_flags_without_saving_state/model/question.dart';

class FlagRepo {
  List<Question> getFlags(int count) {
    List<String> list = _countries.toList();
    list.shuffle();
    list = count < list.length ? list.sublist(0, count) : list;
    return list.map(_question).toList();
  }

  Question _question(String country) {
    Question question = Question(country);
    List<String> list = _countries.toList();
    list.remove(country);

    list.shuffle();
    question.questions.add(country);
    question.questions.addAll(list.sublist(0, 3));
    question.questions.shuffle();
    return question;
  }

  final List<String> _countries = [
    "Afghanistan",
    "Algeria",
    "Argentina",
    "Australia",
    "Austria",
    "Belgium",
    "Bolivia",
    "Botswana",
    "Brazil",
    "Bulgaria",
    "Cambodia",
    "Cameroon",
    "China",
    "Colombia",
    "Congo",
    "Denmark",
    "Ecuador",
    "Egypt",
    "Ethiopia",
    "Finland",
    "France",
    "Gambia",
    "Germany",
    "Ghana",
    "Greece",
    "Guinea",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kenya",
    "Latvia",
    "Liberia",
    "Libya",
    "Malaysia",
    "Myanmar",
    "Netherlands",
    "North Korea",
    "Pakistan",
    "Paraguay",
    "Portugal",
    "Romania",
    "South Korea",
    "Tunisia",
    "United Kingdom",
    "United States",
    "Vietnam",
    "Yemen"
  ];
}
