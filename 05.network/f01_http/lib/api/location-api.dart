import 'dart:convert';

import 'package:f01_http/api/dto/division.dart';
import 'package:http/http.dart' as http;

class LocationApi {
  divisions() {
    return http
        .get("http://localhost:8080/locations")
        .then((value) => json.decode(value.body))
        .then((value) =>
            List.from(value).map((e) => Division.fromJson(e)).toList());
  }

  divisionWithTownships(int id) {
    return http
        .get("http://localhost:8080/locations/$id")
        .then((value) => json.decode(value.body))
        .then((value) => DivisionWithTownship.fromJson(value));
  }
}
