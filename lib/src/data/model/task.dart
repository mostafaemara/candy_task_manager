class Task {
  Task(
      {required this.isCompleted,
      required this.taskNote,
      required this.id,
      required this.date,
      required this.isAlarm,
      required this.isNotification});

  final bool isCompleted;
  final String taskNote;

  final DateTime date;
  final bool isAlarm;
  final bool isNotification;
  final String id;
}
