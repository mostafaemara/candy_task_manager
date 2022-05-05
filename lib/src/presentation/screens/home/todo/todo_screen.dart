import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/application/bloc/tasks/tasks.state.dart';
import 'package:task_manger/src/application/bloc/tasks/tasks_cubit.dart';
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
            child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) => state.isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                )
              : ListView.builder(
                  itemCount: state.todayTasks.length,
                  itemBuilder: (context, index) => TaskListItem(
                      task: state.todayTasks[index],
                      onChange: (value) {
                        context
                            .read<TasksCubit>()
                            .markAsCompleted(state.todayTasks[index].id);
                      }),
                ),
        ))
      ],
    );
  }
}
