import 'dart:io';

import 'package:flutter/services.dart';
import 'package:qaed/database/article_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper instance = DbHelper._();
  DbHelper._();
  Database? _database;
  static const _dbName = "bayanat.db";
  static const _table = "bayanat";
  static const id = "id";
  static const _title = "title";
  static const _detail = "detail";
  static const _year = "year";
  static const _favorite = "favorite";

  Future get _db async => _database ?? await _initDb();

  _initDb() async {
    final dbPath = await getDatabasesPath();
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
    Future<List<Article>> getAllArticle() async {
    Database _dbClient = await _db;
    var allSokhan = await _dbClient.query(_table);
    List<Article> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Article.fromMap(e)).toList()
        : [];
    return allSokhanList;

  }

}
