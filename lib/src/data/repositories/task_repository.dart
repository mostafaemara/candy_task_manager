import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/data/model/task_input.dart';
import 'package:task_manger/src/data/model/tasks_of_date.dart';

class TaskRepository {
  Future<List<Task>> readTodayTasks() async {
    throw UnimplementedError();
  }

  Future<List<TasksOfDate>> readUpCommingTasks() async {
    throw UnimplementedError();
  }

  Future<Task> addTask(TaskInput input) async {
    throw UnimplementedError();
  }

  Future<void> deleteTask(String id) async {
    throw UnimplementedError();
  }
}
