import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/common/submission_state.dart';
import 'package:task_manger/src/data/exception/auth_exception.dart';
import 'package:task_manger/src/data/model/login_input.dart';
import 'package:task_manger/src/data/repositories/auth_repository.dart';

class LoginCubit extends Cubit<SubmissionState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(SubmissionState.init());

  void login(String email, String password) async {
    try {
      emit(state.copyWith(submissionStatus: SubmissionStatus.submitting));
      await _authRepository.login(LoginInput(email: email, password: password));
      emit(state.copyWith(submissionStatus: SubmissionStatus.success));
    } on AuthException {
      emit(state.copyWith(error: "", submissionStatus: SubmissionStatus.error));
    }
  }
}
