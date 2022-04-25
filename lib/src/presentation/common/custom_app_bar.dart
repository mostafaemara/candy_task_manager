import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget trailing;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        actions: [trailing],
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 4),
        ),
        leading: leading);
  }
}
