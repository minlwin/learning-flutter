import 'package:f01_http/model/dto/division.dto.dart';

class Township {
  final int id;
  final String name;

  Township({
    required this.id,
    required this.name,
  });

  factory Township.from(Map<String, dynamic> map) => Township(
        id: map['id'],
        name: map['name'],
      );

  static List<Township> list(List<dynamic> list) =>
      List.from(list.map((e) => Township.from(e)));
}

class DivisionWithTownships {
  final Division division;
  final List<Township> township;

  DivisionWithTownships({required this.division, required this.township});

  factory DivisionWithTownships.from(Map<String, dynamic> map) =>
      DivisionWithTownships(
          division: Division.from(map['division']),
          township: Township.list(map['township']));
}
