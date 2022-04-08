import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/screens/edite_profile/edite_profile_screen.dart';
import 'package:task_manger/src/presentation/screens/home/home_screen.dart';
import 'package:task_manger/src/presentation/screens/login/login_screen.dart';
import 'package:task_manger/src/presentation/screens/new_task/new_task_screen.dart';
import 'package:task_manger/src/presentation/screens/signup/signup_screen.dart';
import 'package:task_manger/src/presentation/screens/splash/splash_screen.dart';
import "package:auto_route/auto_route.dart";
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(
      page: LoginScreen,
    ),
    AutoRoute(page: SignupScreen),
    AutoRoute(page: NewTaskScreen),
    AutoRoute(page: EditeProfileScreen),
  ],
)
class AppRouter extends _$AppRouter {}
