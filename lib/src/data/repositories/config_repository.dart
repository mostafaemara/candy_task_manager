import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manger/src/data/model/language.dart';
import 'package:task_manger/src/data/model/theme_mode.dart';

class ConfigRepository {
  ConfigRepository(this._db);

  final SharedPreferences _db;
  final _langKey = "lang_key";
  final _themeKey = "theme_key";
  final _isFirstTimeKey = "is_first_time_key";
  Future<void> writeLanguage(Language lang) async {
    await _db.setString(_langKey, lang.code);
  }

  Language readLanguage() {
    final langString = _db.getString(_langKey);

    if (langString != null) {
      return Language.fromString(langString);
    }
    return Language.english;
  }

  Future<void> writeTheme(ThemeMode theme) async {
    await _db.setString(_themeKey, theme.value);
  }

  ThemeMode readTheme() {
    final themeString = _db.getString(_themeKey);

    if (themeString != null) {
      return ThemeMode.fromString(themeString);
    }
    return ThemeMode.light;
  }

  Future<void> writeIsFirstTime(bool value) async {
    await _db.setBool(_isFirstTimeKey, value);
  }

  bool readIsFirstTime() {
    final value = _db.getBool(_isFirstTimeKey);

    return value ?? true;
  }
}
