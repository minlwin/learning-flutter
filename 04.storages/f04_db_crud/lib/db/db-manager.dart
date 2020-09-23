import 'package:f04_db_crud/db/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBManager {
  static final DBManager manager = DBManager._internal();
  // private constructor
  DBManager._internal();

  // Single Database Object
  static Database _database;

  Future<Database> get database async {
    // first time
    if (null == _database) {
      // initialize once
      _database = await _initDB();
    }

    return _database;
  }

  Future<Database> _initDB() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        "product.db",
      ),
      onCreate: (db, version) {
        return db.execute(PRODUCT_TBL);
      },
      version: 1,
    );
  }
}
