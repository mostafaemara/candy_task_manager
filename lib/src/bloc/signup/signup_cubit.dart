import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/data/exception/auth_exception.dart';
import 'package:task_manger/src/data/model/signup_input.dart';
import 'package:task_manger/src/data/repositories/auth_repository.dart';

import '../submission_state.dart';

class SignupCubit extends Cubit<SubmissionState> {
  final AuthRepository _authRepository;
  SignupCubit(this._authRepository) : super(SubmissionState.init());

  void signup(String email, String password) async {
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.submitting));
      await _authRepository
          .signup(SignupInput(email: email, password: password));
      emit(state.copyWith(submissionStatus: SubmissionStatus.success));
    } on AuthException {
      emit(state.copyWith(error: "", submissionStatus: SubmissionStatus.error));
    }
  }
}
