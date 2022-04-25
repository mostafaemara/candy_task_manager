import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        Images.searchIcon,
        width: 20,
        height: 20,
      ),
      onPressed: onPressed,
    );
  }
}
