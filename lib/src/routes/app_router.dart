import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';

import 'package:task_manger/src/ui/edite_profile/edite_profile_screen.dart';
import 'package:task_manger/src/ui/home/home_screen.dart';
import 'package:task_manger/src/ui/home/notifications/notifications_screen.dart';
import 'package:task_manger/src/ui/home/settings/settings_screen.dart';

import 'package:task_manger/src/ui/home/todo/today_tasks_screen.dart';
import 'package:task_manger/src/ui/home/upcoming_tasks/upcoming_tasks_screen.dart';

import 'package:task_manger/src/ui/new_task/new_task_screen.dart';

import 'package:task_manger/src/ui/splash/splash_screen.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen, children: [
      AutoRoute(page: TodayTasksScreen),
      AutoRoute(page: UpcomingTasksScreen),
      AutoRoute(page: NotificationsScreen),
      AutoRoute(page: SettingsScreen),
    ]),
    AutoRoute(page: NewTaskScreen),
    AutoRoute(page: EditeProfileScreen),
  ],
)
class AppRouter extends _$AppRouter {}
