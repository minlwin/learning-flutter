import 'dart:convert';

import 'package:f02_pos/model/dto/category.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.category,
    this.price,
    this.deleted,
  });

  int id;
  String name;
  Category category;
  int price;
  bool deleted;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
        price: json["price"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category.toJson(),
        "price": price,
        "deleted": deleted,
      };
}
