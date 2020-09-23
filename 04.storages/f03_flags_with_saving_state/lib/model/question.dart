class Question {
  String country;
  List<String> questions = [];

  Question(this.country);

  Flag get flag => Flag(country);

  Question.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        questions = List.from(json['questions'].map((a) => a.toString()));

  Map<String, dynamic> toJson() => {
        'country': country,
        'questions': questions,
      };
}

class Flag {
  String country;
  Flag(this.country);
  String get image => "images/${country.replaceAll(" ", "_")}.png";
}
