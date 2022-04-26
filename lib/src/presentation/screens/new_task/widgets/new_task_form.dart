import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/form_field_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/presentation/common/subtitle.dart';
import 'package:task_manger/src/presentation/common/check_box_list_tile.dart';

class NewTaskForm extends StatelessWidget {
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Theme.of(context).colorScheme.onBackground),
            hintText: AppLocalizations.of(context)!.writeHere,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            fillColor: Theme.of(context).colorScheme.background,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              FormFieldLabel(label: AppLocalizations.of(context)!.completeBy),
              const SizedBox(
                height: 8,
              ),
              TextFormField(),
              const SizedBox(
                height: 16,
              ),
              FormFieldLabel(label: AppLocalizations.of(context)!.priority),
              const SizedBox(
                height: 8,
              ),
              TextFormField(),
              const SizedBox(
                height: 48,
              ),
              Subtitle(title: AppLocalizations.of(context)!.moreOptions),
              const SizedBox(
                height: 16,
              ),
              CheckBoxListTile(
                  value: false,
                  title: AppLocalizations.of(context)!.saveAsAlarm,
                  onChange: (v) {}),
              CheckBoxListTile(
                  value: true,
                  title: AppLocalizations.of(context)!.showAsNotification,
                  onChange: (v) {}),
            ],
          ),
        ),
      ],
    ));
  }
}
