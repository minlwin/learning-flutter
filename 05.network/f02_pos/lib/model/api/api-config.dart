import 'package:flutter/foundation.dart';

class ApiConfig {
  String get host {
    String server = defaultTargetPlatform == TargetPlatform.android
        ? "10.0.2.2"
        : "localhost";
    return "$server:8080";
  }

  String get baseApi {
    return "http://$host";
  }

  String api(String path) => "$baseApi/$path";
}
