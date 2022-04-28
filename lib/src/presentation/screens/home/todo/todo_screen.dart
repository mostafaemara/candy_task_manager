import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:task_manger/src/presentation/common/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/presentation/common/search_button.dart';
import 'package:task_manger/src/presentation/common/task_list_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
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
    return Column(
      children: [
        CustomAppBar(
          actions: [SearchButton(onPressed: () {})],
          title: AppLocalizations.of(context)!.todo,
        ),
        Header(title: AppLocalizations.of(context)!.todayList),
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
    );
  }
}
