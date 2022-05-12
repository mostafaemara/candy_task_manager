import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:task_manger/src/bloc/config/config_cubit.dart';
import 'package:task_manger/src/routes/app_router.dart';
import 'package:task_manger/src/utils/images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
        imageFlex: 1,
        bodyFlex: 1,
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.bottomCenter,
        contentMargin: const EdgeInsets.all(10),
        imagePadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        pageColor: Theme.of(context).colorScheme.background,
        bodyPadding: const EdgeInsets.only(left: 15, right: 15),
        bodyTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Theme.of(context).colorScheme.onBackground),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Theme.of(context).colorScheme.onBackground));
    final imageHeight = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).colorScheme.onBackground,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
        isTopSafeArea: true,
        pages: [
          PageViewModel(
            decoration: pageDecoration,
            title: "Mange Your Task",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Image.asset(Images.onboarding_1, height: imageHeight),
          ),
          PageViewModel(
            decoration: pageDecoration,
            title: "Work On Time",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Image.asset(Images.onboarding_2, height: imageHeight),
          ),
          PageViewModel(
            decoration: pageDecoration,
            title: "Get reminder on time",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Image.asset(Images.onboarding_3, height: imageHeight),
          )
        ],
        onDone: () {
          context.read<ConfigCubit>().finishOnboarding();
          AutoRouter.of(context).replace(const HomeRoute());
          // When done button is press
        },
        onSkip: () {
          context.read<ConfigCubit>().finishOnboarding();
          AutoRouter.of(context).replace(const HomeRoute());
        },
        showNextButton: false,
        showBackButton: false,
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: Theme.of(context).colorScheme.onBackground),
        ),
        globalBackgroundColor: Theme.of(context).colorScheme.background,
        done: Text("Done",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Theme.of(context).colorScheme.onBackground)),
      ),
    );
  }
}
