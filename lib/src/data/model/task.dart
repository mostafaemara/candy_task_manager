import 'dart:convert';

class Task {
  Task({
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

  final int id;

  Map<String, dynamic> toMap() {
    return {
      'isCompleted': isCompleted,
      'taskNote': taskNote,
      'date': date.toIso8601String(),
      'isAlarm': isAlarm,
      'id': id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
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
    bool? isNotification,
  }) {
    return Task(
        isCompleted: isCompleted ?? this.isCompleted,
        taskNote: taskNote ?? this.taskNote,
        date: date ?? this.date,
        isAlarm: isAlarm ?? this.isAlarm,
        id: id);
  }
}
