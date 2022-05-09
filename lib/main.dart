import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manger/src/bloc/login/login_cubit.dart';
import 'package:task_manger/src/bloc/new_task/new_task_cubit.dart';
import 'package:task_manger/src/bloc/notification/notification_cubit.dart';
import 'package:task_manger/src/bloc/signup/signup_cubit.dart';
import 'package:task_manger/src/bloc/splash/splash_bloc.dart';
import 'package:task_manger/src/bloc/tasks/tasks_cubit.dart';

import 'package:task_manger/src/data/repositories/auth_repository.dart';

import 'package:task_manger/src/data/repositories/notification_repository.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';
import 'package:task_manger/src/data/repositories/user_repository.dart';
import 'package:task_manger/src/data/sqlite_helper.dart';
import 'package:task_manger/src/mangers/notification_manger.dart';
import 'package:task_manger/src/mangers/tasks_manger.dart';
import 'src/app.dart';

import "src/data/model/notification.dart" as not;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _sqlHelper = SqliteHelper();
  final _sqlDb = await _sqlHelper.initDb();
  final _tasksRepository = TaskRepository(_sqlDb);
  final _notificationRepository = Notificationrepository(_sqlDb);
  final NotificationManger _notificationManger =
      NotificationManger(onNotificationDisplay: (id, title, body) async {
    await _notificationRepository
        .addNotification(not.Notification(id: id, body: body, title: title));
  }, onSelectNotification: (id, action) {
    log("Action " + id.toString() + action.toString());
  });
  await _notificationManger.initialize();

  final _db = await SharedPreferences.getInstance();
  final _userRepo = UserRepository(_db);
  final _authRepo = AuthRepository(_userRepo);

  final _taskManger = TaskManger(_tasksRepository, _notificationManger);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SplashCubit(_userRepo),
    ),
    BlocProvider(
      create: (context) => LoginCubit(_authRepo),
    ),
    BlocProvider(
      create: (context) => SignupCubit(_authRepo),
    ),
    BlocProvider(
      create: (context) => TasksCubit(_taskManger)..init(),
    ),
    BlocProvider(
      create: (context) => NewTaskCubit(_taskManger),
    ),
    BlocProvider(
      create: (context) => NotificationCubit(_notificationRepository)..init(),
    ),
  ], child: TaskMangerApp()));
}
