import 'dart:convert';

class TaskInput {
  TaskInput(
      {required this.taskNote,
      required this.date,
      required this.isAlarm,
      required this.isNotification});

  final String taskNote;

  final DateTime date;
  final bool isAlarm;
  final bool isNotification;

  Map<String, dynamic> toMap() {
    return {
      'taskNote': taskNote,
      'date': date.toIso8601String(),
      'isAlarm': isAlarm ? 1 : 0,
      'isNotification': isNotification ? 1 : 0,
      "isCompleted": 0
    };
  }

  String toJson() => json.encode(toMap());
}
