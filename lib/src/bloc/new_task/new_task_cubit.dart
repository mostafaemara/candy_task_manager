import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/bloc/submission_state.dart';
import 'package:task_manger/src/data/model/task_input.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';
import 'package:task_manger/src/mangers/notification_manger.dart';

class NewTaskCubit extends Cubit<SubmissionState> {
  NewTaskCubit(
    this._taskRepository,
    this._notificationManger,
  ) : super(SubmissionState.init());
  final TaskRepository _taskRepository;
  final NotificationManger _notificationManger;
  void addNewTask(
    TaskInput input,
  ) async {
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.submitting));

      final task = await _taskRepository.addTask(input);
      await _notificationManger.scheduleNotification(
          id: task.id,
          date: task.date,
          title: input.notificationTitle,
          isAlarm: task.isAlarm,
          body: task.taskNote);
      emit(state.copyWith(submissionStatus: SubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), submissionStatus: SubmissionStatus.error));
    }
  }
}
