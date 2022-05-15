import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/validators/task_errors.dart';
import 'package:task_manger/src/validators/task_validators.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  _DateFormFieldState createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  _DateFormFieldState();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value, context),
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: _handleDateTimePicker,
              icon: Icon(
                Icons.date_range,
                color: Theme.of(context).colorScheme.onBackground,
              )),
          hintText: "yyyy-MM-dd HH:mm"),
    );
  }

  void _handleDateTimePicker() async {
    var date = await _pickDate();

    if (date != null) {
      final time = await _pickTime();

      if (time != null) {
        date =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);

        widget.controller.text = DateFormat("yyyy-MM-dd HH:mm").format(date);
      }
    }
  }

  Future<DateTime?> _pickDate() async {
    return await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        builder: (context, child) => Theme(
            child: child!,
            data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    background: Colors.red,
                    onSurface: Theme.of(context).colorScheme.secondary,
                    primary: Theme.of(context).colorScheme.secondary))),
        initialDate: DateTime.now(),
        currentDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
  }

  Future<TimeOfDay?> _pickTime() async {
    return await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      builder: (context, child) => Theme(
          child: child!,
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  onSurface: Theme.of(context).colorScheme.onSurface,
                  primary: Theme.of(context).colorScheme.secondary))),
      initialTime: TimeOfDay.now(),
    );
  }
}

String? validator(String? value, BuildContext context) {
  switch (dateValidator(value)) {
    case DateError.invalid:
      return AppLocalizations.of(context)!.dateInvalid;
    case DateError.empty:
      return AppLocalizations.of(context)!.dateRequired;

    default:
      return null;
  }
}
