class Division {
  final int id;
  final String name;
  final String capital;
  final String region;

  Division({
    required this.id,
    required this.name,
    required this.capital,
    required this.region,
  });

  factory Division.from(Map<String, dynamic> map) => Division(
        id: map['id'],
        name: map['name'],
        capital: map['capital'],
        region: map['region'],
      );

  static List<Division> list(List<dynamic> list) =>
      List.from(list.map((e) => Division.from(e)));
}
