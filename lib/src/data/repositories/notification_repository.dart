import 'package:sqflite/sqflite.dart';
import 'package:task_manger/src/data/model/notification.dart';
import 'package:task_manger/src/data/sqlite_helper.dart';

class Notificationrepository {
  final Database _db;
  Notificationrepository(
    this._db,
  );
  Future<void> addNotification(Notification notification) async {
    await _db.insert(SqliteHelper.notificationsTable, notification.toMap());
  }

  Future<List<Notification>> readNotifications() async {
    final maps = await _db.query(SqliteHelper.notificationsTable);

    List<Notification> notifications = [];

    for (final map in maps) {
      notifications.add(Notification.fromMap(map));
    }

    return notifications;
  }

  Future<void> deleteNotification(String id) async {
    throw UnimplementedError();
  }
}
