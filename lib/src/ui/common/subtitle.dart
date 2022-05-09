import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w200,
                color: Theme.of(context).colorScheme.onSurface)));
  }
}
