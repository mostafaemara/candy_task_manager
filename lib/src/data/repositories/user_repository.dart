import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manger/src/data/model/user.dart';

class UserRepository {
  final SharedPreferences _db;
  final _key = "user_key";

  UserRepository(this._db);
  User? readUser() {
    final userRawData = _db.getString(_key);
    if (userRawData != null) {
      return User.fromJson(userRawData);
    }
    return null;
  }

  Future<void> writeUser(User user) => _db.setString(_key, user.toJson());

  Future<void> deleteUSer() => _db.remove(_key);
}
