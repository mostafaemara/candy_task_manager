import 'package:shared_preferences/shared_preferences.dart';

class ConfigRepository {
  ConfigRepository(this._db);

  final SharedPreferences _db;
  final _key = "lang_key";

  Future<void> writeLanguage(String langCode) async {
    await _db.setString(_key, langCode);
  }

  String readLanguage() {
    final lang = _db.getString(_key);
    return lang ?? "en";
  }

  Future<void> writeTheme(String theme) async {
    await _db.setString(_key, theme);
  }

  String readTheme() {
    final lang = _db.getString(_key);
    return lang ?? "en";
  }
}
