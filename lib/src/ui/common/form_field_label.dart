import 'package:flutter/material.dart';

class FormFieldLabel extends StatelessWidget {
  const FormFieldLabel({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 12,
          color: Theme.of(context).colorScheme.onBackground),
    );
  }
}
