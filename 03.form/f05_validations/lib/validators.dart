import 'package:flutter/material.dart';

class NotEmpty {
  final String fieldName;
  NotEmpty(this.fieldName);

  String validate(String value) {
    if (value.isEmpty) {
      return "Please enter $fieldName";
    }
    return null;
  }
}

class MinValue {
  final int min;
  final String fieldName;

  MinValue({@required this.min, @required this.fieldName});

  String validate(String value) {
    if (value.length < min) {
      return "Minimum $fieldName count must be $min";
    }
    return null;
  }
}
