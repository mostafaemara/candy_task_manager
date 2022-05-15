import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/bloc/new_task/new_task_cubit.dart';
import 'package:task_manger/src/bloc/submission_state.dart';
import 'package:task_manger/src/data/model/priority.dart';
import 'package:task_manger/src/data/model/task_input.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:task_manger/src/ui/common/check_box_list_tile.dart';
import 'package:task_manger/src/ui/common/form_field_label.dart';
import 'package:task_manger/src/ui/common/subtitle.dart';
import 'package:task_manger/src/utils/images.dart';

import 'date_form_field.dart';
import 'task_note_form_field.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final TextEditingController _taskNoteController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final _key = GlobalKey<FormState>();
  Priority _taskPriority = Priority.medium;
  bool _isAlarm = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTaskCubit, SubmissionState>(
        builder: (context, state) => state.submissionStatus ==
                SubmissionStatus.submitting
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Form(
                      key: _key,
                      child: Column(
                        children: [
                          TaskNoteFormField(controller: _taskNoteController),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                FormFieldLabel(
                                    label: AppLocalizations.of(context)!
                                        .completeBy),
                                const SizedBox(
                                  height: 8,
                                ),
                                DateFormField(
                                  controller: _dateController,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                FormFieldLabel(
                                    label:
                                        AppLocalizations.of(context)!.priority),
                                const SizedBox(
                                  height: 8,
                                ),
                                DropdownButtonFormField<Priority>(
                                    value: _taskPriority,
                                    items: [
                                      DropdownMenuItem<Priority>(
                                          value: Priority.high,
                                          child: TaskPriorityItem(
                                            title: AppLocalizations.of(context)!
                                                .high,
                                            color: Colors.red,
                                          )),
                                      DropdownMenuItem<Priority>(
                                          value: Priority.medium,
                                          child: TaskPriorityItem(
                                            title: AppLocalizations.of(context)!
                                                .medium,
                                            color: Colors.green,
                                          )),
                                      DropdownMenuItem<Priority>(
                                          value: Priority.low,
                                          child: TaskPriorityItem(
                                            title: AppLocalizations.of(context)!
                                                .low,
                                            color: Colors.grey,
                                          )),
                                    ],
                                    onChanged: (v) {
                                      setState(() {
                                        if (v != null) {
                                          _taskPriority = v;
                                        }
                                      });
                                    }),
                                const SizedBox(
                                  height: 48,
                                ),
                                Subtitle(
                                    title: AppLocalizations.of(context)!
                                        .moreOptions),
                                const SizedBox(
                                  height: 16,
                                ),
                                CheckBoxListTile(
                                    value: _isAlarm,
                                    title: AppLocalizations.of(context)!
                                        .saveAsAlarm,
                                    onChange: _onIsAlarmChange),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    bottom: 12,
                    child: FloatingActionButton(
                      child: Image.asset(
                        Images.checkIcon,
                        width: 16,
                        height: 11.45,
                      ),
                      onPressed: _handleSubmission,
                    ),
                  ),
                ],
              ),
        listener: (ctx, state) {
          if (state.submissionStatus == SubmissionStatus.success) {
            AutoRouter.of(context).pop();
          }
        });
  }

  void _handleSubmission() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      context.read<NewTaskCubit>().addNewTask(TaskInput(
          taskPiriority: _taskPriority,
          taskNote: _taskNoteController.text,
          date: DateTime.parse(_dateController.text),
          isAlarm: _isAlarm,
          notificationTitle: AppLocalizations.of(context)!.youTaskToComplete));
    }
  }

  void _onIsAlarmChange(bool value) {
    setState(() {
      _isAlarm = value;
    });
  }
}

class TaskPriorityItem extends StatelessWidget {
  const TaskPriorityItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(25)),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ]);
  }
}
