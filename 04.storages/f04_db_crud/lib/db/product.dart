import 'package:f04_db_crud/db/db-manager.dart';
import 'package:sqflite/sql.dart';

const PRODUCT_TBL =
    "CREATE TABLE product (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, category TEXT, price INTEGER)";

class Product {
  int id;
  String name;
  String category;
  int price;

  Product({this.id, this.name, this.category, this.price});

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
      };
}

class ProductRepo {
  Future<void> create(Product p) async {
    var db = await DBManager.manager.database;
    await db.insert("product", p.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> getAll() async {
    var db = await DBManager.manager.database;
    var list = await db.query("product");

    return List.generate(
        list.length,
        (index) => Product(
            id: list[index]['id'],
            name: list[index]['name'],
            category: list[index]['category'],
            price: list[index]['price']));
  }

  Future<void> update(Product p) async {
    var db = await DBManager.manager.database;
    return db.update("product", p.toMap(), where: "id = ?", whereArgs: [p.id]);
  }

  Future<void> delete(int id) async {
    var db = await DBManager.manager.database;
    return db.delete("product", where: "id = ?", whereArgs: [id]);
  }
}
