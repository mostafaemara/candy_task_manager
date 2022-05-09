class SplashState {
  SplashState({
    required this.authState,
    required this.isLoading,
  });
  SplashState.init()
      : authState = AuthState.notAuth,
        isLoading = true;

  final AuthState authState;
  final bool isLoading;

  SplashState copyWith({
    AuthState? authState,
    bool? isLoading,
  }) {
    return SplashState(
      authState: authState ?? this.authState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

enum AuthState {
  auth,
  notAuth,
}
