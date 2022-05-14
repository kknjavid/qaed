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
      // print("db already exist");
      return await openDatabase(path);
    } else {
      try {
        // print("creating a copy from assets");
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      // print("db copied...");
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
    return allSokhanList;
  }

  Future<List<Article>> getArticle(int id) async {
    Database _dbClient = await _db;
    var allSokhan =
        await _dbClient.query(_table, where: "id=?", whereArgs: [id]);
    List<Article> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Article.fromMap(e)).toList()
        : [];
    return allSokhanList;
  }

  Future<List<Article>> getFavArticles() async {
    Database _dbClient = await _db;
    var allSokhan = await _dbClient.query(_table,
        columns: ["id", "title", "date", "fav"],
        where: "fav=?",
        whereArgs: [1],
        orderBy: "-id"
        );
    List<Article> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Article.fromMap(e)).toList()
        : [];
    return allSokhanList;
  }

  Future<int> changeFav(Article article) async {
    final fav = article.fav == 1 ? 0 : 1;
    Database _dbClient = await _db;
    var res = await _dbClient.update(_table, {"fav": fav},
        where: "id=?", whereArgs: [article.id]);

    return res;
  }

  Future<int> favRemove(int id) async {
    Database _dbClient = await _db;
    var res = await _dbClient.update(_table, {"fav": 0},
        where: "id=?", whereArgs: [id]);

    return res;
  }

  Future<List> search(String text, int index) async {
    String col = index == 0 ? "title" : "detail";
    Database _dbClient = await _db;
    var allArticles = await _dbClient.query(_table,
        columns: ["id", "title", "date"],
        where: "$col LIKE ?",
        whereArgs: ['%$text%'],
        orderBy: "-id",
        );
    List<Article> articlesList = allArticles.isNotEmpty
        ? allArticles.map((e) => Article.fromMap(e)).toList()
        : [];
    String command =
        "(length($col)-length(replace($col, '$text', ''))) / length('$text')";
    var countsQuery = await _dbClient
        .rawQuery("SELECT $command FROM $_table WHERE $col like '%$text%' ORDER BY -id");
    List counts = countsQuery.isNotEmpty
        ? countsQuery.map((e) => e[command]).toList()
        : [];
    int s = counts.isNotEmpty? counts.reduce((value, element) => value + element):0;
    int sum = s;
    // print(sum);
    List finalList = [];
    if (articlesList.isNotEmpty &&
        counts.isNotEmpty &&
        articlesList.length == counts.length) {
      finalList.add(articlesList);
      finalList.add(counts);
      finalList.add(sum);
    }
    return finalList;
  }
}
