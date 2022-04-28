class LoginState {
  LoginState.init()
      : submissionState = SubmissionState.idle,
        error = "";
  LoginState(this.error, this.submissionState);

  final String error;
  final SubmissionState submissionState;

  LoginState copyWith({
    String? error,
    SubmissionState? submissionState,
  }) {
    return LoginState(
      error ?? this.error,
      submissionState ?? this.submissionState,
    );
  }
}

enum SubmissionState { idle, success, error, submitting }
