import 'dart:convert';

import 'package:flutter/material.dart';

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
  final TaskPiriority taskPiriority;

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
      taskPiriority: TaskPiriority.fromString(map["priority"]),
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
    TaskPiriority? taskPiriority,
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

enum TaskPiriority {
  high("high"),
  medium("medium"),
  low("low");

  final String value;
  const TaskPiriority(this.value);

  factory TaskPiriority.fromString(String value) {
    switch (value) {
      case "high":
        return TaskPiriority.high;
      case "medium":
        return TaskPiriority.medium;
      case "low":
        return TaskPiriority.low;
      default:
        throw const FormatException("Invalid String value");
    }
  }

  Color toColor() {
    switch (this) {
      case TaskPiriority.high:
        return Colors.red;

      case TaskPiriority.medium:
        return Colors.green;
      case TaskPiriority.low:
        return Colors.grey;
    }
  }
}
