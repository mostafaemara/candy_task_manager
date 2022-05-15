import 'dart:convert';

import 'package:task_manger/src/data/model/priority.dart';

class Task {
  Task({
    required this.taskPiriority,
    required this.isCompleted,
    required this.taskNote,
    required this.id,
    required this.date,
    required this.isAlarm,
  });

  final bool isCompleted;
  final String taskNote;

  final DateTime date;
  final bool isAlarm;
  final Priority taskPiriority;

  final int id;

  Map<String, dynamic> toMap() {
    return {
      "priority": taskPiriority.value,
      'isCompleted': isCompleted,
      'taskNote': taskNote,
      'date': date.toIso8601String(),
      'isAlarm': isAlarm,
      'id': id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskPiriority: Priority.parse(map["priority"]),
      isCompleted: map['isCompleted'] == 1 ? true : false,
      taskNote: map['taskNote'],
      date: DateTime.parse(map['date']),
      isAlarm: map['isAlarm'] == 1 ? true : false,
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  Task copyWith({
    bool? isCompleted,
    String? taskNote,
    DateTime? date,
    bool? isAlarm,
    Priority? taskPiriority,
    int? id,
  }) {
    return Task(
      isCompleted: isCompleted ?? this.isCompleted,
      taskNote: taskNote ?? this.taskNote,
      date: date ?? this.date,
      isAlarm: isAlarm ?? this.isAlarm,
      taskPiriority: taskPiriority ?? this.taskPiriority,
      id: id ?? this.id,
    );
  }
}
