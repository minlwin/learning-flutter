class Item {
  final String name;
  final String brand;

  Item(this.name, this.brand);

  String get image => "images/${name.replaceAll(" ", "-").toLowerCase()}.png";
}

class ItemRepo {
  static List<Item> getItems() => [
        Item("Avaitor", "Rayban"),
        Item("Waifarer", "Rayban"),
        Item("Black Pilot", "AO"),
        Item("Lisbon", "Police"),
        Item("Round Matel", "Rayban"),
        Item("Stavenger", "Prada"),
      ];
}
