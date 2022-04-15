import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class AppBarWithSearch extends StatelessWidget {
  final String title;
  final VoidCallback onSearchPressed;
  final VoidCallback onDrawerPressed;

  const AppBarWithSearch({
    Key? key,
    required this.title,
    required this.onSearchPressed,
    required this.onDrawerPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: Image.asset(
            Images.searchIcon,
            width: 20,
            height: 20,
          ),
          onPressed: onSearchPressed,
        ),
      ],
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 4),
      ),
      leading: IconButton(
        icon: Image.asset(
          Images.menuIcon,
          width: 20,
          height: 20,
        ),
        onPressed: onDrawerPressed,
      ),
    );
  }
}
