import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/modal/question.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "flutter.db");
    var exists = await databaseExists(path);

    if (!exists) {
      print('creating a new copy from asset!');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "flutter.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print('opening existing database');
    }

    return await openDatabase(path, readOnly: true);
  }

  Future<List> getQuestions(Category category, int total) async {
    Database db = await this.db;
    var result =
        await db.rawQuery('SELECT * FROM ydsdb ORDER BY RANDOM() LIMIT $total');
    return Question.fromData(result);
  }
}
