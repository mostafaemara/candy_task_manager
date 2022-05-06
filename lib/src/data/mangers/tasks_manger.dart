import 'package:task_manger/src/data/mangers/notification_manger.dart';
import 'package:task_manger/src/data/model/tasks_of_date.dart';
import 'package:task_manger/src/data/model/task_input.dart';
import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';

class TaskManger implements TaskRepository {
  final TaskRepository taskRepository;
  final NotificationManger notificationManger;

  TaskManger(this.taskRepository, this.notificationManger);
  @override
  Future<Task> addTask(TaskInput input) async {
    final task = await taskRepository.addTask(input);

    if (task.isNotification && !task.isCompleted) {
      await notificationManger.scheduleNotification(
          id: task.id,
          title: task.taskNote,
          body: task.taskNote,
          payload: task.taskNote,
          date: task.date,
          isAlarm: task.isAlarm);
    }

    return task;
  }

  @override
  Future<void> deleteTask(String id) => taskRepository.deleteTask(id);

  @override
  Stream get onTasksChange => taskRepository.onTasksChange;

  @override
  Future<List<Task>> readTodayTasks() async {
    final tasks = await taskRepository.readTodayTasks();
    scheduleTasksNotifications(tasks);
    return tasks;
  }

  void scheduleTasksNotifications(List<Task> tasks) async {
    for (final task in tasks) {
      if (task.isNotification && !task.isCompleted) {
        await notificationManger.scheduleNotification(
            id: task.id,
            title: task.taskNote,
            body: task.taskNote,
            payload: task.taskNote,
            date: task.date,
            isAlarm: task.isAlarm);
      }
    }
  }

  @override
  Future<List<TasksOfDate>> readUpCommingTasks() async {
    final tasksOfDates = await taskRepository.readUpCommingTasks();
    for (final tasksOfDate in tasksOfDates) {
      scheduleTasksNotifications(tasksOfDate.tasks);
    }

    return tasksOfDates;
  }

  @override
  Future<void> updateTask(Task task) async {
    await taskRepository.updateTask(task);
  }
}
