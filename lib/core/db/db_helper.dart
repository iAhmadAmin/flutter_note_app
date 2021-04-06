import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database _db;
  static final int _version = 1;
  static final String _tablename = 'notes';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'notes.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tablename(id INTEGER KEY AUTOINCREMENT, title STRING, note TEXT, date STRING)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Note note) async {
    print("Insert function called");
    return await _db.insert(_tablename, note.toJson());
  }

  static Future<int> delete(Note note) async {
    return await _db.delete(_tablename, where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return _db.query(_tablename);
  }

  static Future<int> update(Note note) async {
    print("update function called");
    return await _db.rawUpdate('''
      UPDATE notes
      SET title = ?, note = ?
      WHERE id = ?    
      ''', [note.title, note.note, note.id]);
  }
}
