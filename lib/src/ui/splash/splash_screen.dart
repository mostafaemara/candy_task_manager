import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:auto_route/auto_route.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/bloc/config/config_cubit.dart';
import 'package:task_manger/src/bloc/config/config_state.dart';

import 'package:task_manger/src/routes/app_router.dart';
import 'package:task_manger/src/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    context.read<ConfigCubit>().init(const Duration(seconds: 2));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfigCubit, ConfigState>(
      listener: (_, state) => {
        if (state.isLoading == false)
          {
            AutoRouter.of(context).replace(
                state.isFirstTime ? const OnboardingRoute() : const HomeRoute())
          }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.logo,
                height: 240,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Candy",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30),
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
}
