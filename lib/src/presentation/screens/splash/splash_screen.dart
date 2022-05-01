import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/bloc/splash/splash_bloc.dart';
import 'package:task_manger/src/application/bloc/splash/splash_state.dart';
import 'package:task_manger/src/presentation/routes/app_router.dart';
import 'package:task_manger/src/presentation/utils/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    context.read<SplashCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (_, state) => _handleState(context, state),
      child: Scaffold(
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
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, SplashState state) {
    log(state.isLoading.toString());
    if (state.isLoading == false) {
      _handleAuthState(context, state.authState);
    }
  }

  void _handleAuthState(BuildContext context, AuthState state) async {
    if (state == AuthState.auth) {
      AutoRouter.of(context).replace(const HomeRoute());
    } else {
      AutoRouter.of(context).replace(const LoginRoute());
    }
  }
}
