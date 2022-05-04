import 'package:flutter/material.dart';
import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/presentation/common/custom_check_box.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final void Function(bool value) onChange;
  const TaskListItem({
    Key? key,
    required this.onChange,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(task.taskNote,
            style: TextStyle(
                fontSize: 12,
                height: 2,
                fontWeight: FontWeight.w200,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withOpacity(task.isCompleted ? 0.5 : 1))),
        leading: CustomCheckBox(
          onChange: onChange,
          value: task.isCompleted,
        ));
  }
}
