import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/bloc/config/config_state.dart';
import 'package:task_manger/src/data/model/language.dart';
import 'package:task_manger/src/data/model/theme_mode.dart';
import 'package:task_manger/src/data/repositories/config_repository.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit(this._configRepository, super.initialState);
  final ConfigRepository _configRepository;
  void init(Duration duration) async {
    final isFirstTime = _configRepository.readIsFirstTime();
    await Future.delayed(duration);
    emit(state.copyWith(isFirstTime: isFirstTime, isLoading: false));
  }

  void changeLanguage(Language language) async {
    await _configRepository.writeLanguage(language);
    emit(state.copyWith(language: language));
  }

  void onToggleThemeMode(bool isDarkMode) async {
    final themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await _configRepository.writeTheme(themeMode);
    log(state.themeMode.toString());
    emit(state.copyWith(themeMode: themeMode));
  }

  void finishOnboarding() async {
    await _configRepository.writeIsFirstTime(false);
  }
}
