import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';
import 'package:task_manger/src/data/repositories/config_repository.dart';
import 'package:task_manger/src/data/repositories/notification_repository.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';
import 'package:task_manger/src/data/sqlite_helper.dart';
import 'package:task_manger/src/mangers/notification_manger.dart';
import "package:task_manger/src/data/model/notification.dart" as not;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotifyOutdatedTaskController {
  static Future<bool> execute() async {
    try {
      if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
      if (Platform.isIOS) SharedPreferencesIOS.registerWith();
      final _sharedPref = await SharedPreferences.getInstance();

      final _configRepo = ConfigRepository(_sharedPref);
      final _sqlHelper = SqliteHelper();
      final _sqlDb = await _sqlHelper.initDb();
      final _tasksRepository = TaskRepository(_sqlDb);
      final _notificationRepository = Notificationrepository(_sqlDb);
      final NotificationManger _notificationManger =
          NotificationManger(onNotificationDisplay: (notification) async {
        await _notificationRepository.addNotification(notification);
      }, onSelectNotification: (id, action) async {
        if (action == NotificationAction.complete) {
          await _tasksRepository.markTaskAsComplete(id);
        }
      });
      await _notificationManger.initialize();

      final tasks = await _tasksRepository.readOutdatedTasks();

      final lang = _configRepo.readLanguage();
      final locale = Locale(lang.code);
      AppLocalizations t = await AppLocalizations.delegate.load(locale);
      for (final task in tasks) {
        await _notificationManger.showNotification(
          notification: not.Notification(
              id: task.id,
              notificationType: not.NotificationType.outDatedTask,
              title: t.outDatedTask,
              body: task.taskNote,
              priority: task.taskPiriority),
        );
      }

      return Future.value(true);
    } catch (e) {
      log(e.toString());
      return Future.value(false);
    }
  }
}
