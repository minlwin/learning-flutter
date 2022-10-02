import 'dart:convert';

import 'package:f01_http/api/dto/division.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LocationApi {
  final String server = defaultTargetPlatform == TargetPlatform.android
      ? "10.0.0.2"
      : "localhost";

  divisions() {
    return http
        .get(Uri.http("$server:8080", "/locations"))
        .then((value) => json.decode(value.body))
        .then((value) =>
            List.from(value).map((e) => Division.fromJson(e)).toList());
  }

  divisionWithTownships(int id) {
    return http
        .get(Uri.http("$server:8080", "/locations/$id"))
        .then((value) => json.decode(value.body))
        .then((value) => DivisionWithTownship.fromJson(value));
  }
}
