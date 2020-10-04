import 'package:medicalshop/DAL/favorite_product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class FavoriteProductsBase {
  static Database _db;
  static const _baseName = "favorite_products.db";
  static const _tableName = "favoriteProducts";

  static Future<void> initDb() async {
    if (_db != null) return;

    _db = await openDatabase(
      join(await getDatabasesPath(), _baseName),
      version: 1,
      onOpen: (db) {
        return db.execute("CREATE TABLE IF NOT EXISTS " + _tableName + " (id INT PRIMARY KEY, liked STRING)");
      },
      onCreate: (db, version) {
        return db.execute("CREATE TABLE IF NOT EXISTS " + _tableName + " (id INT PRIMARY KEY, liked STRING)");
      }
    );
  }

  static Future<bool> isProductLiked(int productId) async {
    List<Map<String, dynamic>> _list = await _db.rawQuery("SELECT * FROM " + _tableName + " WHERE id = ?", [productId]);
    if (_list.isEmpty) {
      return false;
    } else {
      return FavoriteProduct.fromJson(_list[0]).liked;
    }
  }

  static void changeLiked(int productId) async {
    FavoriteProduct _product;
    List<Map<String, dynamic>> _list = await _db.rawQuery("SELECT * FROM " + _tableName + " WHERE id = ?", [productId]);

    if (_list.isEmpty) {
      _product = FavoriteProduct(productId, true);
      _db.insert(
        _tableName,
        _product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      _product = FavoriteProduct.fromJson(_list[0]);
      _product.changeLiked();
      _db.update(
        _tableName,
        _product.toJson(),
        where: "id = ?",
        whereArgs: [productId],
      );
    }
  }
}