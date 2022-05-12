import 'package:task_manger/src/data/model/language.dart';
import 'package:task_manger/src/data/model/theme_mode.dart';

class ConfigState {
  ConfigState(
      {required this.themeMode,
      required this.language,
      this.isLoading = true,
      this.isFirstTime = true});

  final ThemeMode themeMode;
  final Language language;
  final bool isLoading;
  final bool isFirstTime;

  ConfigState copyWith({
    ThemeMode? themeMode,
    Language? language,
    bool? isLoading,
    bool? isFirstTime,
  }) {
    return ConfigState(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      isLoading: isLoading ?? this.isLoading,
      isFirstTime: isFirstTime ?? this.isFirstTime,
    );
  }
}
