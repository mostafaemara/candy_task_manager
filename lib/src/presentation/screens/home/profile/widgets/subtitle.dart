import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
