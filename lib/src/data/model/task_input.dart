import 'dart:convert';

import 'package:task_manger/src/data/model/priority.dart';

class TaskInput {
  TaskInput({
    required this.taskPiriority,
    required this.taskNote,
    required this.notificationTitle,
    required this.date,
    required this.isAlarm,
  });

  final String taskNote;
  final String notificationTitle;
  final Priority taskPiriority;
  final DateTime date;
  final bool isAlarm;

  Map<String, dynamic> toMap() {
    return {
      "priority": taskPiriority.value,
      'taskNote': taskNote,
      'date': date.toIso8601String(),
      'isAlarm': isAlarm ? 1 : 0,
      "isCompleted": 0
    };
  }

  String toJson() => json.encode(toMap());
}
