import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/bloc/tasks/tasks.state.dart';
import 'package:task_manger/src/application/bloc/tasks/tasks_cubit.dart';
import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:task_manger/src/presentation/common/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/presentation/common/search_button.dart';
import 'package:task_manger/src/presentation/common/task_list_item.dart';

class SchedulerScreen extends StatefulWidget {
  const SchedulerScreen({Key? key}) : super(key: key);

  @override
  State<SchedulerScreen> createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        CustomAppBar(
          actions: [SearchButton(onPressed: () {})],
          title: AppLocalizations.of(context)!.scheduler.toUpperCase(),
        ),
        Header(title: AppLocalizations.of(context)!.upcomingTasks),
        Expanded(
            child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) => ListView.builder(
            itemCount: state.todayTasks.length,
            itemBuilder: (context, index) => TaskListItem(
                task: state.todayTasks[index],
                onChange: (value) {
                  setState(() {});
                }),
          ),
        ))
      ],
    ));
  }
}
