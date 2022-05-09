import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.onPressed, required this.label})
      : super(key: key);
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 12,
              color: Theme.of(context).colorScheme.onBackground),
        ));
  }
}
