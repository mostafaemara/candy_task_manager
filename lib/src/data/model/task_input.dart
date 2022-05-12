import 'dart:convert';

class TaskInput {
  TaskInput({
    required this.taskNote,
    required this.notificationTitle,
    required this.date,
    required this.isAlarm,
  });

  final String taskNote;
  final String notificationTitle;

  final DateTime date;
  final bool isAlarm;

  Map<String, dynamic> toMap() {
    return {
      'taskNote': taskNote,
      'date': date.toIso8601String(),
      'isAlarm': isAlarm ? 1 : 0,
      "isCompleted": 0
    };
  }

  String toJson() => json.encode(toMap());
}
