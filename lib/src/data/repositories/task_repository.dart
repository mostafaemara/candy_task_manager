import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/data/model/task_input.dart';
import 'package:task_manger/src/data/model/tasks_of_date.dart';
import 'package:task_manger/src/data/sqlite_helper.dart';
import 'package:task_manger/src/helpers/datetime_helper.dart';

class TaskRepository {
  final Database _db;
  final _controller = StreamController();
  TaskRepository(this._db);
  Future<List<Task>> readTodayTasks() async {
    final maps = await _db.query(SqliteHelper.tasksTable);

    final tasks = _mapListToTasks(maps);
    tasks.retainWhere((element) => element.date.isToday());
    return tasks;
  }

  Future<List<TasksOfDate>> readUpCommingTasks() async {
    final maps = await _db.query(SqliteHelper.tasksTable);
    List<TasksOfDate> tasksOfDates = [];
    final tasks = _mapListToTasks(maps);
    tasks.retainWhere((element) => element.date.isAfterToday());
    tasks.sort(
      (a, b) => a.date.compareTo(b.date),
    );

    var dates = <DateTime>{};

    for (var element in tasks) {
      dates.add(
          DateTime(element.date.year, element.date.month, element.date.day));
    }

    for (final date in dates) {
      final tasksOfSameDate =
          tasks.where((element) => element.date.isSameDateAs(date));

      tasksOfDates
          .add(TasksOfDate(date: date, tasks: tasksOfSameDate.toList()));
    }
    return tasksOfDates;
  }

  Future<Task> addTask(TaskInput input) async {
    final id = await _db.insert(SqliteHelper.tasksTable, input.toMap());

    final newTask = Task(
      isCompleted: false,
      taskNote: input.taskNote,
      id: id,
      date: input.date,
      isAlarm: input.isAlarm,
    );

    _controller.add(id);

    return newTask;
  }

  Future<void> markTaskAsComplete(int id) async {
    await _db.update(SqliteHelper.tasksTable, {'isCompleted': 1},
        where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Task>> readOutdatedTasks() async {
    final maps = await _db.query(SqliteHelper.tasksTable);

    final tasks = _mapListToTasks(maps);
    tasks.retainWhere((element) =>
        (element.date.isBefore(DateTime.now()) && !element.isCompleted));
    return tasks;
  }

  Future<void> deleteTask(String id) async {
    throw UnimplementedError();
  }

  Stream get onTasksChange => _controller.stream;

  List<Task> _mapListToTasks(List<Map<String, dynamic>> maps) {
    final List<Task> tasks = [];

    for (final map in maps) {
      tasks.add(Task.fromMap(map));
    }

    return tasks;
  }
}
