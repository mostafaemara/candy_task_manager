import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';

class NotificationManger {
  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  final void Function(String? payload)? onSelectNotification;

  NotificationManger({this.onSelectNotification});
  Future initialize() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings("notification_icon");

    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    tz.initializeTimeZones();

    return await _flutterLocalNotificationsPlugin?.initialize(
        initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future showNotification(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    if (_flutterLocalNotificationsPlugin == null) {
      throw Exception(
          " NotificationRepository not initialized NotificationRepository used befor calling initialize Method ");
    }
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "id", 'taskmangerNotification',
        channelDescription: 'Task Manger Notifications',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    return await _flutterLocalNotificationsPlugin
        ?.show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  Future scheduleNotification(
      {required int id,
      required String title,
      required String body,
      required String payload,
      required DateTime date}) async {
    if (_flutterLocalNotificationsPlugin == null) {
      throw Exception(
          " NotificationRepository not initialized NotificationRepository used befor calling initialize Method ");
    }
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "id", 'taskmangerNotification',
        channelDescription: 'Task Manger Notifications',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    return await _flutterLocalNotificationsPlugin?.zonedSchedule(
      id,
      title,
      body,
      TZDateTime.from(date, local),
      platformChannelSpecifics,
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
