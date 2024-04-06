import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE emtnotes(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('emt.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createNotes(String title, String? description) async {
    final db = await SQLHelper.db();
    final data = {'title': title, 'description': description};
    print(data);
    final id = await db.insert('emtnotes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
        print("New note created $id");
    return id;
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await SQLHelper.db();
    return db.query('emtnotes', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getNote(int id) async {
    final db = await SQLHelper.db();
    return db.query('emtnotes', where: "id =?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateNote(
      int id, String title, String? desciption) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': desciption,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('emtnotes', data, where: "id =?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteNote(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("emtnotes", where: "id=?", whereArgs: [id]);
    } catch (ex) {
      print(ex);
      debugPrint("somwthing went wrong when delteting an note :$ex");
    }
  }
}
