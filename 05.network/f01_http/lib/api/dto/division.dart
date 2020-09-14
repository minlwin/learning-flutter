class Division {
  int id;
  String name;
  String capital;
  String region;

  Division({this.id, this.name, this.capital, this.region});

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
        id: json['id'],
        name: json['name'],
        capital: json['capital'],
        region: json['region']);
  }
}

class Township {
  int id;
  String name;

  Township({this.id, this.name});

  factory Township.fromJson(Map<String, dynamic> json) {
    return Township(
      id: json['id'],
      name: json['name'],
    );
  }
}

class DivisionWithTownship {
  Division division;
  List<Township> townships;

  DivisionWithTownship({this.division, this.townships});

  factory DivisionWithTownship.fromJson(Map<String, dynamic> json) {
    return DivisionWithTownship(
        division: Division.fromJson(json['division']),
        townships: List.from(json['township'])
            .map((e) => Township.fromJson(e))
            .toList());
  }
}
