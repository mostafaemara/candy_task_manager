import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/bloc/submission_state.dart';
import 'package:task_manger/src/data/model/task_input.dart';
import 'package:task_manger/src/data/repositories/task_repository.dart';

class NewTaskCubit extends Cubit<SubmissionState> {
  NewTaskCubit(
    this._taskRepository,
  ) : super(SubmissionState.init());
  final TaskRepository _taskRepository;
  void addNewTask(TaskInput input) async {
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.submitting));

      final task = await _taskRepository.addTask(input);
      emit(state.copyWith(submissionStatus: SubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), submissionStatus: SubmissionStatus.error));
    }
  }
}
