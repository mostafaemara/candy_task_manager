import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static const String id = 'id';
  static const String taskNote = 'taskNote';
  static const String priority = 'priority';

  static const String isCompleted = 'isCompleted';
  static const String isAlarm = 'isAlarm';
  static const String date = 'date';
  static const String title = 'title';
  static const String body = 'body';
  static const String notificationType = 'notificationType';

  static const String tasksTable = 'tasks';
  static const String notificationsTable = 'notifications';

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, 'task_manger.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE $tasksTable($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $taskNote TEXT, $priority TEXT, $isCompleted INTEGER,  $date TEXT, $isAlarm INTEGER)');

      await db.execute(
          'CREATE TABLE $notificationsTable($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $title TEXT, $body TEXT, $priority TEXT, $notificationType TEXT)');
    }, version: 1);

    return db;
  }
}
