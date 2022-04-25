import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:task_manger/src/presentation/common/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/presentation/common/menu_button.dart';
import 'package:task_manger/src/presentation/common/search_button.dart';
import 'package:task_manger/src/presentation/common/task_list_item.dart';

class SchedulerScreen extends StatefulWidget {
  const SchedulerScreen({Key? key}) : super(key: key);

  @override
  State<SchedulerScreen> createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  static var todos = [
    {
      "title": "todo title",
      "isCompleted": true,
    },
    {
      "title": "todo title",
      "isCompleted": false,
    },
    {
      "title": "todo title",
      "isCompleted": true,
    },
    {
      "title": "todo title",
      "isCompleted": true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        CustomAppBar(
          trailing: SearchButton(onPressed: () {}),
          leading: MenuButton(onPressed: () {}),
          title: AppLocalizations.of(context)!.scheduler.toUpperCase(),
        ),
        Header(title: AppLocalizations.of(context)!.upcomingTasks),
        Expanded(
            child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => TaskListItem(
              todo: todos[index],
              onChange: (value) {
                setState(() {
                  todos[index]["isCompleted"] = value;
                });
              }),
        ))
      ],
    ));
  }
}
