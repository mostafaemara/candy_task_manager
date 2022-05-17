import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/bloc/tasks/tasks.state.dart';
import 'package:task_manger/src/bloc/tasks/tasks_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:task_manger/src/ui/common/custom_app_bar.dart';
import 'package:task_manger/src/ui/common/header.dart';
import 'package:task_manger/src/ui/common/loading_indicator.dart';
import 'package:task_manger/src/ui/common/task_list_item.dart';
import 'package:task_manger/src/utils/images.dart';

class TodayTasksScreen extends StatefulWidget {
  const TodayTasksScreen({Key? key}) : super(key: key);

  @override
  State<TodayTasksScreen> createState() => _TodayTasksScreenState();
}

class _TodayTasksScreenState extends State<TodayTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: AppLocalizations.of(context)!.todo,
        ),
        Header(title: AppLocalizations.of(context)!.todayList),
        Expanded(
            child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) => state.isLoading
              ? const LoadingIndicator()
              : state.todayTasks.isEmpty
                  ? Center(
                      child: Image.asset(
                        Images.emptyTasks,
                        width: 150,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.todayTasks.length,
                      itemBuilder: (context, index) => TaskListItem(
                          task: state.todayTasks[index],
                          onChange: (value) {
                            context.read<TasksCubit>().markTodayTaskAsCompleted(
                                state.todayTasks[index].id);
                          }),
                    ),
        ))
      ],
    );
  }
}
