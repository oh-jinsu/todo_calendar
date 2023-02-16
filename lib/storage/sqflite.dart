import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

late final Database sqflite;

Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'sqflite_v0.db');

  if (kDebugMode) {
    await deleteDatabase(path);
  }

  sqflite = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE todo (id INTEGER PRIMARY KEY, content TEXT NOT NULL, doneAt TEXT, createdAt TEXT NOT NULL)',
      );
    },
  );

  return sqflite;
}
