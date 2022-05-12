import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_manger/src/bloc/config/config_cubit.dart';
import 'package:task_manger/src/bloc/config/config_state.dart';
import 'package:task_manger/src/routes/app_router.dart';
import 'package:task_manger/src/styles/themes.dart';
import "package:task_manger/src/data/model/theme_mode.dart" as app;

class TaskMangerApp extends StatelessWidget {
  TaskMangerApp({
    Key? key,
  }) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigCubit, ConfigState>(
      builder: (context, state) => MaterialApp.router(
        locale: Locale(state.language.code),
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: state.themeMode == app.ThemeMode.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}
