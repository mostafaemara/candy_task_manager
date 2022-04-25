import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/styles/colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({Key? key, required this.onChange, required this.value})
      : super(key: key);
  final void Function(bool value) onChange;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!value);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.5),
            border: Border.all(width: 2, color: AppColors.aquamarine)),
        width: 24,
        height: 24,
        child: value
            ? Container(
                width: 22,
                height: 22,
                color: AppColors.aquamarine,
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 15,
                ))
            : null,
      ),
    );
  }
}
