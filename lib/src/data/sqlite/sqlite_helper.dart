import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static const String id = 'id';
  static const String taskNote = 'taskNote';
  static const String isNotification = 'isNotification';
  static const String isCompleted = 'isCompleted';
  static const String isAlarm = 'isAlarm';
  static const String date = 'date';

  static const String table = 'tasks';

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, 'task_manger.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $table($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $taskNote TEXT, $isNotification INTEGER, $isCompleted INTEGER,  $date TEXT, $isAlarm INTEGER)');
    }, version: 1);

    return db;
  }
}
