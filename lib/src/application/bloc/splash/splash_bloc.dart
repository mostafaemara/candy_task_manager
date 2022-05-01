import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/bloc/splash/splash_state.dart';
import 'package:task_manger/src/data/repositories/user_repository.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._userRepository) : super(SplashState.init());
  final UserRepository _userRepository;
  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = _userRepository.readUser();

    if (user != null) {
      emit(state.copyWith(
        isLoading: false,
        authState: AuthState.auth,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        authState: AuthState.notAuth,
      ));
    }
  }
}
