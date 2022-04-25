import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_check_box.dart';

class TaskListItem extends StatelessWidget {
  final todo;
  final void Function(bool value) onChange;
  const TaskListItem({
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
