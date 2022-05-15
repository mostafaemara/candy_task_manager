import 'dart:convert';

import 'package:task_manger/src/data/model/priority.dart';

class Notification {
  Notification(
      {required this.id,
      required this.notificationType,
      required this.title,
      required this.body,
      required this.priority});
  final int id;
  final String title;
  final String body;
  final Priority priority;
  final NotificationType notificationType;
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      "priority": priority.value,
      "notificationType": notificationType.value
    };
  }

  Map<String, String> toStringMap() {
    return {
      "id": id.toString(),
      'title': title,
      'body': body,
      "priority": priority.value,
      "notificationType": notificationType.value
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
        notificationType: NotificationType.parse(map['notificationType']),
        id: map['id']?.toInt() ?? 0,
        title: map['title'] ?? '',
        body: map['body'] ?? '',
        priority: Priority.parse(map["priority"]));
  }
  factory Notification.fromStringMap(Map<String, String> map) {
    return Notification(
        notificationType: NotificationType.parse(map['notificationType'] ?? ""),
        id: int.parse(map['id']!),
        title: map['title'] ?? '',
        body: map['body'] ?? '',
        priority: Priority.parse(map["priority"] ?? ""));
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source));
}

enum NotificationType {
  outDatedTask("outdated_task"),
  normal("normal");

  final String value;
  const NotificationType(this.value);

  factory NotificationType.parse(String value) {
    switch (value) {
      case "outdated_task":
        return NotificationType.outDatedTask;
      case "normal":
        return NotificationType.normal;

      default:
        throw const FormatException("Invalid String valu");
    }
  }
}
