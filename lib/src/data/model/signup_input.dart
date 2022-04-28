class SignupInput {
  final String email;
  final String password;

  SignupInput({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
