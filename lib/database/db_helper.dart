import 'dart:io';

import 'package:flutter/services.dart';
import 'package:qaed/database/article_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  // static DbHelper instance = DbHelper._();
  // DbHelper._();
  Database? _database;
  static const _dbName = "bayanat.db";
  static const _table = "bayanat";

  Future get _db async => _database ?? await _initDb();

  _initDb() async {
    final dbPath = await getDatabasesPath;
    final path = join(dbPath, _dbName);
    bool dbExist = await databaseExists(path);
    if (dbExist) {
      print("db already exist");
      return await openDatabase(path);
    } else {
      try {
        print("creating a copy from assets");
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print("db copied...");
      return await openDatabase(path);
    }
  }

  Future<List<Article>> getAllArticleByYear(int year) async {
    Database _dbClient = await _db;
    var allSokhan = await _dbClient.query(_table,
        columns: ["id", "title", "date"],
        where: "date LIKE ?",
        whereArgs: ['%$year%']);
    List<Article> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Article.fromMap(e)).toList()
        : [];
    _dbClient.close();
    return allSokhanList;
  }

  Future<List<Article>> getArticle(int id) async {
    Database _dbClient = await _db;
    var allSokhan =
        await _dbClient.query(_table, where: "id=?", whereArgs: [id]);
    List<Article> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Article.fromMap(e)).toList()
        : [];
    _dbClient.close();
    return allSokhanList;
  }

  Future<List<Article>> getFavArticles() async {
    Database _dbClient = await _db;
    var allSokhan = await _dbClient.query(_table,
        columns: ["id", "title", "date", "fav"],
        where: "fav=?",
        whereArgs: [1]);
    List<Article> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Article.fromMap(e)).toList()
        : [];
    _dbClient.close();
    return allSokhanList;
  }

  Future<int> changeFav(Article article) async {
    final fav = article.fav == 1 ? 0 : 1;
    Database _dbClient = await _db;
    var res = await _dbClient.update(_table, {"fav": fav},
        where: "id=?", whereArgs: [article.id]);

    _dbClient.close();
    return res;
  }
   Future<int> favRemove(int id) async {
   
    Database _dbClient = await _db;
    var res = await _dbClient.update(_table, {"fav": 0},
        where: "id=?", whereArgs: [id]);

    _dbClient.close();
    return res;
  }
}
