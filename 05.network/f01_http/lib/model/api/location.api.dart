import 'dart:convert';

import 'package:f01_http/model/dto/division.dto.dart';
import 'package:f01_http/model/dto/township.dto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LocationApi {
  late Client client;

  String get baseApi {
    String server = defaultTargetPlatform == TargetPlatform.android
        ? "10.0.2.2"
        : "localhost";
    return "$server:8080";
  }

  LocationApi() {
    client = Client();
  }

  Future<List<Division>> divisions() =>
      client.get(Uri.http(baseApi, 'locations')).then(
        (value) {
          return jsonDecode(value.body);
        },
      ).then(
        (value) {
          return Division.list(value);
        },
      );

  Future<DivisionWithTownships> findById(int id) => client
      .get(Uri.http(baseApi, 'locations/$id'))
      .then((value) => jsonDecode(value.body))
      .then((value) => DivisionWithTownships.from(value));
}
