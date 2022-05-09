import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/data/model/tasks_of_date.dart';

class TasksState {
  TasksState(
      {required this.todayTasks,
      required this.tasksOfDate,
      required this.isLoading});

  const TasksState.init()
      : isLoading = true,
        tasksOfDate = const [],
        todayTasks = const [];

  final List<Task> todayTasks;
  final List<TasksOfDate> tasksOfDate;
  final bool isLoading;

  TasksState copyWith({
    List<Task>? todayTasks,
    List<TasksOfDate>? tasksOfDate,
    bool? isLoading,
  }) {
    return TasksState(
      todayTasks: todayTasks ?? this.todayTasks,
      tasksOfDate: tasksOfDate ?? this.tasksOfDate,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
