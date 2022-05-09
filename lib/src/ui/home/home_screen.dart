import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:task_manger/src/routes/app_router.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TodoRoute(),
        SchedulerRoute(),
        SchedulerRoute(),
        NotificationsRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (_, router) => AppBottomNavBar(
        currentIndex: router.activeIndex,
        onTap: router.setActiveIndex,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).navigate(const NewTaskRoute());
          },
          child: const Icon(Icons.add)),
    );
  }
}
