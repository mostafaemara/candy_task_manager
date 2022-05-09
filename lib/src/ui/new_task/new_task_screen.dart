import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:task_manger/src/ui/common/custom_app_bar.dart';
import 'package:task_manger/src/ui/new_task/widgets/new_task_form.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.newTask.toUpperCase()),
      body: const NewTaskForm(),
    );
  }
}
