import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manger/src/bloc/config/config_cubit.dart';
import 'package:task_manger/src/bloc/config/config_state.dart';
import 'package:task_manger/src/bloc/new_task/new_task_cubit.dart';
import 'package:task_manger/src/bloc/notification/notification_cubit.dart';
import 'package:task_manger/src/bloc/tasks/tasks_cubit.dart';
import 'package:task_manger/src/data/repositories/config_repository.dart';

import 'package:task_manger/src/data/repositories/notification_repository.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';

import 'package:task_manger/src/data/sqlite_helper.dart';
import 'package:task_manger/src/mangers/notification_manger.dart';
import 'package:task_manger/src/mangers/notify_outdated_tasks_controller.dart';
import 'package:workmanager/workmanager.dart';

import 'src/app.dart';

import "src/data/model/notification.dart" as not;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _sharedPref = await SharedPreferences.getInstance();

  final _configRepo = ConfigRepository(_sharedPref);
  final _sqlHelper = SqliteHelper();
  final _workManger = Workmanager();
  final _sqlDb = await _sqlHelper.initDb();
  final _tasksRepository = TaskRepository(_sqlDb);
  final _notificationRepository = Notificationrepository(_sqlDb);
  final NotificationManger _notificationManger =
      NotificationManger(onNotificationDisplay: (id, title, body) async {
    await _notificationRepository
        .addNotification(not.Notification(id: id, body: body, title: title));
  }, onSelectNotification: (id, action) async {
    if (action == NotificationAction.complete) {
      await _tasksRepository.markTaskAsComplete(id);
      log(action.toString());
    }
  });
  await _notificationManger.initialize();
  _workManger.initialize(
    callbackDispatcher,
    // The top level function, aka callbackDispatcher
  );

  await _workManger.registerPeriodicTask(
      "notify_outdated_task", "Notify Outdated Tasks",
      existingWorkPolicy: ExistingWorkPolicy.keep,
      frequency: const Duration(days: 1));

  final _lang = _configRepo.readLanguage();
  final _themeMode = _configRepo.readTheme();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ConfigCubit(
          _configRepo, ConfigState(language: _lang, themeMode: _themeMode)),
    ),
    BlocProvider(
      create: (context) =>
          TasksCubit(_tasksRepository, _notificationManger)..init(),
    ),
    BlocProvider(
      create: (context) => NewTaskCubit(_tasksRepository, _notificationManger),
    ),
    BlocProvider(
      create: (context) => NotificationCubit(_notificationRepository)..init(),
    ),
  ], child: TaskMangerApp()));
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    return await NotifyOutdatedTaskController.execute();
  });
}
