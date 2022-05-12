import 'package:flutter/material.dart';
import 'package:task_manger/src/data/model/task.dart';
import 'package:task_manger/src/ui/common/custom_check_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      ),
      trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: task.taskPiriority.toColor(),
                  borderRadius: BorderRadius.circular(25)),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              translate(task.taskPiriority, context).toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
          ]),
    );
  }

  String translate(TaskPiriority taskPiriority, BuildContext context) {
    switch (taskPiriority) {
      case TaskPiriority.high:
        return AppLocalizations.of(context)!.high;
      case TaskPiriority.medium:
        return AppLocalizations.of(context)!.medium;
      case TaskPiriority.low:
        return AppLocalizations.of(context)!.low;
    }
  }
}
