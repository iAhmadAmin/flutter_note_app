import 'package:note_app/core/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tablename = 'notes';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}notes.db';
      _db =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tablename(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING)",
        );
      });
    } catch (e) {}
  }

  static Future<int> insert(Note note) async {
    return await _db!.insert(_tablename, note.toJson());
  }

  static Future<int> delete(Note note) async {
    return await _db!.delete(_tablename, where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return _db!.query(_tablename);
  }

  static Future<int> update(Note note) async {
    return await _db!.rawUpdate(
      "UPDATE notes SET title = ?, note = ? WHERE id = ? ",
      [note.title, note.text, note.id],
    );
  }
}
