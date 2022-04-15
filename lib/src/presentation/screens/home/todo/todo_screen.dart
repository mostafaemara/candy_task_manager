import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/app_bar_with_search.dart';
import 'package:task_manger/src/presentation/common/header.dart';
import 'package:task_manger/src/presentation/styles/colors.dart';

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
    return SizedBox(
        child: Column(
      children: [
        AppBarWithSearch(
          onDrawerPressed: () {},
          onSearchPressed: () {},
          title: "TO-DO",
        ),
        const Header(title: "Today's list ---"),
        Expanded(
            child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => TodoListItem(
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

class TodoListItem extends StatelessWidget {
  final todo;
  final void Function(bool value) onChange;
  const TodoListItem({
    Key? key,
    this.todo,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(todo["title"] as String,
            style: TextStyle(
                fontSize: 12,
                height: 2,
                fontWeight: FontWeight.w200,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withOpacity(todo["isCompleted"] ? 0.5 : 1))),
        leading: CustomCheckBox(
          onChange: onChange,
          value: todo["isCompleted"] as bool,
        ));
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({Key? key, required this.onChange, required this.value})
      : super(key: key);
  final void Function(bool value) onChange;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!value);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.5),
            border: Border.all(width: 2, color: AppColors.aquamarine)),
        width: 24,
        height: 24,
        child: value
            ? Container(
                width: 22,
                height: 22,
                color: AppColors.aquamarine,
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 15,
                ))
            : null,
      ),
    );
  }
}
