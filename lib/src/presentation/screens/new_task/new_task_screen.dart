import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/presentation/screens/new_task/widgets/new_task_form.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.newTask.toUpperCase()),
      body: const NewTaskForm(),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          Images.checkIcon,
          width: 16,
          height: 11.45,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
