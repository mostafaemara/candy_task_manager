import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_manger/src/data/repositories/notification_repository.dart';

import 'firebase_options.dart';
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
  await notificationRepository.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen(
    (message) {
      if (message.notification != null) {
        notificationRepository.showNotification(
            id: 3,
            title: message.notification!.title!,
            body: message.notification!.body!,
            payload: message.data.toString());
      }
    },
  );
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(TaskMangerApp());
}
