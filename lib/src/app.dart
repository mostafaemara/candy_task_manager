import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:task_manger/src/presentation/routes/app_router.dart';
import 'package:task_manger/src/presentation/styles/themes.dart';

class TaskMangerApp extends StatelessWidget {
  TaskMangerApp({
    Key? key,
  }) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale("en"),
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
      themeMode: ThemeMode.light,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
