import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.init());

  void init() async {
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      isLoading: false,
      authState: AuthState.auth,
    ));
  }
}
