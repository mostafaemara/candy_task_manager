import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manger/src/application/bloc/login/login_cubit.dart';
import 'package:task_manger/src/application/bloc/signup/signup_cubit.dart';
import 'package:task_manger/src/application/bloc/splash/splash_bloc.dart';
import 'package:task_manger/src/data/repositories/auth_repository.dart';
import 'package:task_manger/src/data/repositories/notificationz_repository.dart';
import 'package:task_manger/src/data/repositories/user_repository.dart';

import 'src/app.dart';

final NotificationRepository notificationRepository = NotificationRepository();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final NotificationRepository _notificationRepository =
      NotificationRepository();
  await _notificationRepository.initialize();
  if (message.notification != null) {
    _notificationRepository.showNotification(
        id: 1,
        title: message.notification!.title!,
        body: message.notification!.body!,
        payload: message.data.toString());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _db = await SharedPreferences.getInstance();
  final _userRepo = UserRepository(_db);
  final _authRepo = AuthRepository(_userRepo);
  // await notificationRepository.initialize();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // NotificationSettings settings =
  //     await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onMessage.listen(
  //   (message) {
  //     if (message.notification != null) {
  //       notificationRepository.showNotification(
  //           id: 3,
  //           title: message.notification!.title!,
  //           body: message.notification!.body!,
  //           payload: message.data.toString());
  //     }
  //   },
  // );
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SplashCubit(_userRepo),
    ),
    BlocProvider(
      create: (context) => LoginCubit(_authRepo),
    ),
    BlocProvider(
      create: (context) => SignupCubit(_authRepo),
    )
  ], child: TaskMangerApp()));
}
