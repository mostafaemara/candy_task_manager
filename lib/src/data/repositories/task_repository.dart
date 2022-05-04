import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/data/model/task_input.dart';
import 'package:task_manger/src/data/model/tasks_of_date.dart';
import 'package:task_manger/src/data/sqlite/sqlite_helper.dart';

class TaskRepository {
  final Database _db;
  final StreamController<List<Task>> _tasksController =
      StreamController<List<Task>>();

  List<Task>? _tasks;
  TaskRepository(this._db);
  Future<List<Task>> readTodayTasks() async {
    final maps = await _db.query(SqliteHelper.table);

    _tasks = _mapListToTasks(maps);
    return _tasks!;
  }

  Future<List<TasksOfDate>> readUpCommingTasks() async {
    throw UnimplementedError();
  }

  Future<Task> addTask(TaskInput input) async {
    final id = await _db.insert(SqliteHelper.table, input.toMap());

    _tasks ??= await readTodayTasks();

    final newTask = Task(
        isCompleted: false,
        taskNote: input.taskNote,
        id: id,
        date: input.date,
        isAlarm: input.isAlarm,
        isNotification: input.isNotification);
    _tasks?.add(newTask);

    _tasksController.add(_tasks!);
    return newTask;
  }

  Future<void> updateTask(Task task) async {
    await _db.update(SqliteHelper.table, task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(String id) async {
    throw UnimplementedError();
  }

  Stream<List<Task>> onTasksChanged() => _tasksController.stream;

  List<Task> _mapListToTasks(List<Map<String, dynamic>> maps) {
    final List<Task> tasks = [];

    for (final map in maps) {
      tasks.add(Task.fromMap(map));
    }

    return tasks;
  }
}
