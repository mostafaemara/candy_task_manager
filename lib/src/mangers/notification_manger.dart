import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';

enum NotificationAction { complete, cancel }

class NotificationManger {
  final _awesomeNotifications = AwesomeNotifications();
  final void Function(int id, NotificationAction action)? onSelectNotification;
  final void Function(int id, String title, String body)? onNotificationDisplay;

  NotificationManger({this.onNotificationDisplay, this.onSelectNotification});

  Future initialize() async {
    await _awesomeNotifications.initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              criticalAlerts: true,
              channelGroupKey: 'candy_notify',
              channelKey: 'candy_task_manger_mse_schd_notify',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultRingtoneType: DefaultRingtoneType.Notification),
          NotificationChannel(
              channelShowBadge: true,
              criticalAlerts: true,
              channelGroupKey: 'basic_channel_group',
              channelKey: 'candy_task_manger_mse_schd_alarm',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              importance: NotificationImportance.Max,
              enableVibration: true,
              defaultRingtoneType: DefaultRingtoneType.Alarm)
        ],
        // Channel groups are only visual and are not required

        debug: true);
    final isNotificationAllowed =
        await _awesomeNotifications.isNotificationAllowed();
    if (!isNotificationAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      await _awesomeNotifications.requestPermissionToSendNotifications();
    }
    if (onNotificationDisplay != null) {
      _awesomeNotifications.displayedStream.listen((event) async {
        onNotificationDisplay!(event.id!, event.title!, event.body!);
      });
    }

    if (onSelectNotification != null) {
      _awesomeNotifications.actionStream.listen((event) {
        onSelectNotification!(
            event.id!,
            event.buttonKeyPressed == "complete"
                ? NotificationAction.complete
                : NotificationAction.cancel);
      });
    }
  }

  Future cancelNotification(int id) => _awesomeNotifications.cancel(id);

  Future showNotification(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'candy_task_manger_mse_schd_notify',
        title: title,
        body: body,
        wakeUpScreen: true,
        criticalAlert: true,
        category: NotificationCategory.Message,
        displayOnBackground: true,
        displayOnForeground: true,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(key: 'complete', label: "complete"),
        NotificationActionButton(key: 'cancel', label: 'cancel'),
      ],
    );
  }

  Future scheduleNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime date,
      bool isAlarm = false}) async {
    try {
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: id,
          channelKey: isAlarm
              ? 'candy_task_manger_mse_schd_alarm'
              : 'candy_task_manger_mse_schd_notify',
          title: title,
          body: body,
          wakeUpScreen: true,
          criticalAlert: true,
          category: isAlarm
              ? NotificationCategory.Call
              : NotificationCategory.Message,
          displayOnBackground: true,
          displayOnForeground: true,
          notificationLayout: NotificationLayout.Default,
        ),
        actionButtons: [
          NotificationActionButton(key: 'complete', label: "complete"),
          NotificationActionButton(key: 'cancel', label: 'cancel'),
        ],
        schedule: NotificationCalendar.fromDate(
            date: date,
            allowWhileIdle: true,
            preciseAlarm: true,
            repeats: true),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
