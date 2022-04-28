import 'package:task_manger/src/data/model/login_input.dart';
import 'package:task_manger/src/data/model/signup_input.dart';
import 'package:task_manger/src/data/model/user.dart';
import 'package:task_manger/src/data/repositories/user_repository.dart';

class AuthRepository {
  AuthRepository(this._userRepository);
  final UserRepository _userRepository;

  Future<void> login(LoginInput loginInput) async {
    await Future.delayed(const Duration(seconds: 1));

    final user = User(
        email: loginInput.email, profilePic: "", token: "token", uid: "uid");
    await _userRepository.writeUser(user);
  }

  Future<void> signup(SignupInput signupInput) async {
    await Future.delayed(const Duration(seconds: 1));

    final user = User(
        email: signupInput.email, profilePic: "", token: "token", uid: "uid");
    await _userRepository.writeUser(user);
  }

  Future<void> logout() async {
    await _userRepository.deleteUSer();
  }
}
