import 'package:notes/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print('creating a new one');
        return db.execute(
          'CREATE TABLE $_tableName('
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title STRING, note STRING, date STRING, "
          "startTime STRING, endtTime STRING, "
          "reminder INTEGER, repeat STRING, "
          "color INTEGER, "
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert function called');
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('query');
    return await _db!.query(_tableName);
  }
}
