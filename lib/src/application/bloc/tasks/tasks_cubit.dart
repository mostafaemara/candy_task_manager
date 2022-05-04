import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/bloc/tasks/tasks.state.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this._taskRepository) : super(const TasksState.init());

  final TaskRepository _taskRepository;

  void init() async {
    try {
      final tasks = await _taskRepository.readTodayTasks();

      emit(state.copyWith(isLoading: false, todayTasks: tasks));
    } catch (e) {
      log(e.toString());
    }
  }
}
