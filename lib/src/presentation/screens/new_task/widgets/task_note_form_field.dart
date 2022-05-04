import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/application/validators/task_validators.dart';
import 'package:task_manger/src/data/errors/task_errors.dart';

class TaskNoteFormField extends StatelessWidget {
  const TaskNoteFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => _validator(value, context),
      controller: controller,
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
    );
  }
}

String? _validator(String? value, BuildContext context) {
  switch (fieldValidator(value)) {
    case FieldError.empty:
      return AppLocalizations.of(context)!.fieldRequired;

    case FieldError.none:
      return null;
  }
}
