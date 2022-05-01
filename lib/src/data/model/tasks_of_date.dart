import 'package:task_manger/src/data/model/task.dart';

class TasksOfDate {
  final DateTime date;
  final List<Task> tasks;

  TasksOfDate({required this.date, required this.tasks});
}
