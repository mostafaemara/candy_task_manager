import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/login/login_state.dart';
import 'package:task_manger/src/data/exception/auth_exception.dart';
import 'package:task_manger/src/data/model/login_input.dart';
import 'package:task_manger/src/data/repositories/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginState.init());

  void login(String email, String password) async {
    try {
      emit(state.copyWith(submissionState: SubmissionState.submitting));
      await _authRepository.login(LoginInput(email: email, password: password));
      emit(state.copyWith(submissionState: SubmissionState.success));
    } on AuthException {
      emit(state.copyWith(error: "", submissionState: SubmissionState.error));
    }
  }
}
