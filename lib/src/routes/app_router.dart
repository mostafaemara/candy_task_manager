import 'package:flutter/material.dart';

import "package:auto_route/auto_route.dart";
import 'package:task_manger/src/ui/edite_profile/edite_profile_screen.dart';
import 'package:task_manger/src/ui/home/home_screen.dart';
import 'package:task_manger/src/ui/home/notifications/notifications_screen.dart';
import 'package:task_manger/src/ui/home/profile/profile_screen.dart';
import 'package:task_manger/src/ui/home/scheduler/scheduler_screen.dart';
import 'package:task_manger/src/ui/home/todo/todo_screen.dart';
import 'package:task_manger/src/ui/login/login_screen.dart';
import 'package:task_manger/src/ui/new_task/new_task_screen.dart';
import 'package:task_manger/src/ui/signup/signup_screen.dart';
import 'package:task_manger/src/ui/splash/splash_screen.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen, children: [
      AutoRoute(page: TodoScreen),
      AutoRoute(page: SchedulerScreen),
      AutoRoute(page: NotificationsScreen),
      AutoRoute(page: ProfileScreen),
    ]),
    AutoRoute(
      page: LoginScreen,
    ),
    AutoRoute(page: SignupScreen),
    AutoRoute(page: NewTaskScreen),
    AutoRoute(page: EditeProfileScreen),
  ],
)
class AppRouter extends _$AppRouter {}
