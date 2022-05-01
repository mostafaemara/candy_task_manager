import 'package:shared_preferences/shared_preferences.dart';

class ConfigRepository {
  ConfigRepository(this._db);

  final SharedPreferences _db;
  final _key = "lang_key";

  Future<void> writeLanguage(String langCode) async {}
  String readLanguage() {
    return "";
  }
}
