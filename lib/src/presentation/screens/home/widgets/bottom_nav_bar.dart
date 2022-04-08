import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);
  final int currentIndex;
  final Function(int) onTap;
  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    _controller.index = widget.currentIndex;

    _controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      child: TabBar(
          onTap: (index) {
            if (index == 2) {
              _controller.index = _controller.previousIndex;
            }
            widget.onTap(_controller.index);
          },
          indicatorWeight: 4,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          controller: _controller,
          tabs: [
            Tab(
              icon: Image.asset(
                _controller.index == 0
                    ? Images.selected_todo_list_icon
                    : Images.todoListIcon,
                height: 24,
                width: 24,
              ),
            ),
            Tab(
              icon: Image.asset(
                _controller.index == 1
                    ? Images.selected_upcoming_tasks_icon
                    : Images.upcomingTasksIcon,
                height: 24,
                width: 24,
              ),
            ),
            const Tab(
              icon: SizedBox(
                width: 0,
                height: 0,
              ),
            ),
            Tab(
              icon: Image.asset(
                _controller.index == 3
                    ? Images.selected_notification_icon
                    : Images.notification_icon,
                height: 24,
                width: 24,
              ),
            ),
            Tab(
              icon: Image.asset(
                _controller.index == 4
                    ? Images.selected_profile_icon
                    : Images.profile_icon,
                height: 24,
                width: 24,
              ),
            )
          ]),
    );
  }
}
