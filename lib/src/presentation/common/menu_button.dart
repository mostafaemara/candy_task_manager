import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        Images.menuIcon,
        width: 24,
        height: 24,
      ),
      onPressed: onPressed,
    );
  }
}
