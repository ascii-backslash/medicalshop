import 'dart:async';
import 'favorite_product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteProductsBase {
  static Database _database;
  static List<FavoriteProduct> _list;
  static final FavoriteProductsBase access = FavoriteProductsBase._();

  static const tableName = "favoriteProducts";

  FavoriteProductsBase._();

  Future<bool> isProductLiked(int productId) async {
    if (_list == null) {
      _list = await initList();
    }

    int index = _list.indexWhere((element) => element.id == productId);
    if (index == -1) {
      return false;
    } else {
      return _list[index].liked;
    }
  }

  Future<void> changeLiked(int productId) async {
    if (_list == null) {
      _list = await initList();
    }

    int index = _list.indexWhere((element) => element.id == productId);
    if (index == -1) {
      FavoriteProduct _favoriteProduct = FavoriteProduct(productId, true);
      _list.add(_favoriteProduct);
      await insertFavoriteProduct(_favoriteProduct);
    } else {
      _list[index].changeLiked();
      await updateFavoriteProduct(_list[index]);
    }
  }

  Future<List<FavoriteProduct>> initList() async {
    if (_database == null) {
      _database = await initDb();
    }

    List<Map<String, dynamic>> maps = await _database.query(tableName);

    return List.generate(maps.length, (index) {
      return FavoriteProduct.fromJson(maps[index]);
    });
  }

  Future<Database> initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), "favorite_products.db"),
      version: 1,
      onOpen: (db) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS " + tableName + "(id INT PRIMARY KEY, liked STRING)"
        );
      },
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS " + tableName + "(id INT PRIMARY KEY, liked STRING)"
        );
      }
    );
  }

  Future<void> insertFavoriteProduct(FavoriteProduct favoriteProduct) async {
    if (_database == null) {
      _database = await initDb();
    }

    await _database.insert(
      tableName,
      favoriteProduct.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateFavoriteProduct(FavoriteProduct favoriteProduct) async {
    if (_database == null) {
      _database = await initDb();
    }

    await _database.update(
      tableName,
      favoriteProduct.toJson(),
      where: "id = ?",
      whereArgs: [favoriteProduct.id],
    );
  }
}