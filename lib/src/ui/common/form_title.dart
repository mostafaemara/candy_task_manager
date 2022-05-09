import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          letterSpacing: 4,
          color: Theme.of(context).colorScheme.onBackground),
    );
  }
}
