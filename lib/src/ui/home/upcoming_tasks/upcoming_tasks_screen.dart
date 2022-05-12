import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/bloc/tasks/tasks.state.dart';
import 'package:task_manger/src/bloc/tasks/tasks_cubit.dart';
import 'package:task_manger/src/data/model/tasks_of_date.dart';
import 'package:task_manger/src/helpers/datetime_helper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:task_manger/src/ui/common/custom_app_bar.dart';
import 'package:task_manger/src/ui/common/header.dart';
import 'package:task_manger/src/ui/common/subtitle.dart';
import 'package:task_manger/src/ui/common/task_list_item.dart';
import 'package:task_manger/src/utils/images.dart';

class UpcomingTasksScreen extends StatefulWidget {
  const UpcomingTasksScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingTasksScreen> createState() => _UpcomingTasksScreenState();
}

class _UpcomingTasksScreenState extends State<UpcomingTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        CustomAppBar(
          title: AppLocalizations.of(context)!.scheduler.toUpperCase(),
        ),
        Header(title: AppLocalizations.of(context)!.upcomingTasks),
        Expanded(
            child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) => state.isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                )
              : state.todayTasks.isEmpty
                  ? Center(
                      child: Image.asset(
                        Images.emptyTasks,
                        width: 150,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.tasksOfDate.length,
                      itemBuilder: (context, index) =>
                          UpComingTasks(tasksOfDate: state.tasksOfDate[index]),
                    ),
        ))
      ],
    ));
  }
}

class UpComingTasks extends StatelessWidget {
  const UpComingTasks({Key? key, required this.tasksOfDate}) : super(key: key);
  final TasksOfDate tasksOfDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Subtitle(
              title: tasksOfDate.date.isTomorrow()
                  ? AppLocalizations.of(context)!.tomorrow
                  : tasksOfDate.date.customFormate()),
        ),
        ...List.generate(
            tasksOfDate.tasks.length,
            (index) => TaskListItem(
                task: tasksOfDate.tasks[index], onChange: (value) {})).toList()
      ],
    );
  }
}
