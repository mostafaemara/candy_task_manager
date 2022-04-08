import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/routes/app_router.dart';
import 'package:task_manger/src/presentation/utils/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToLogin(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo,
              height: 240,
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              AppLocalizations.of(context)!.splashTitle,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    AutoRouter.of(context).replace(const LoginRoute());
  }
}
