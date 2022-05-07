import 'dart:async';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();

      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path, 'azkar.db');
    var mydb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    // for (var item in category) {
    await db.execute("""
      CREATE TABLE IF NOT EXISTS sabah(
   id        INTEGER  NOT NULL PRIMARY KEY,
   category  VARCHAR(12) NOT NULL
  ,counter   INTEGER  NOT NULL
  ,source    VARCHAR(184)
  ,reference VARCHAR(26)
  ,title     VARCHAR(487) NOT NULL 
);

      """);
    print(' Table Created');
  }

  Future<int> create(Map<String, dynamic> data) async {
    initialDB();
    var dbClient = await db;

    var insert = dbClient!.insert('sabah', data);

    return insert;
  }

  Future<List<Map<String, dynamic>>?> getData() async {
    var dbClient = await db;

    var notes = await dbClient?.query(
      'sabah',
      orderBy: 'id ASC',
      // limit: 3,
    );

    return notes;
  }

  Future<List> getCount(String zekerType) async {
    var dbClint = await db;
    var count = await dbClint!.rawQuery('SELECT COUNT(*) FROM $zekerType');
    return count;
  }

  Future<List> getSingleRow(int id) async {
    var dbClient = await db;

    var note = await dbClient!.query('sabah', where: 'id = "$id"');

    return note;
  }
}
