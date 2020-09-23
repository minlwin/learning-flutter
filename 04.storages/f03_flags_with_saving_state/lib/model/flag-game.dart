import 'package:f02_flags_without_saving_state/model/flags-repo.dart';
import 'package:f02_flags_without_saving_state/model/question.dart';
import 'package:flutter/material.dart';

class FlagGame {
  List<Question> questions;
  List<String> answers;
  int current;
  int correct;

  FlagGame({this.questions, this.answers, this.current, this.correct});

  FlagGame._({@required this.questions}) {
    this.answers = [];
    this.correct = 0;
    this.current = 0;
  }

  factory FlagGame.of(int count) =>
      FlagGame._(questions: FlagRepo().getFlags(count));

  FlagGame.fromJson(Map<String, dynamic> json)
      : questions =
            List.from(json['questions'].map((e) => Question.fromJson(e))),
        answers = List.from(json['answers'].map((e) => e.toString())),
        correct = json['correct'],
        current = json['current'];

  Map<String, dynamic> toJson() => {
        'questions': questions.map((e) => e.toJson()).toList(),
        'answers': answers,
        'current': current,
        'correct': correct
      };

  String get title => "${current + 1} / ${questions.length}";

  String get result => "$correct / ${questions.length}";

  String get grade {
    double level = correct / questions.length * 100;
    if (level < 50) {
      return "Try again!";
    } else if (level >= 50 && level < 80) {
      return "Pass!";
    } else if (level >= 80 && level < 100) {
      return "Excellent!";
    }
    return "Perfect!";
  }

  Question next() {
    if (current < questions.length) {
      return questions[current];
    }
    return null;
  }
}
