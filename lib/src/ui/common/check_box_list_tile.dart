import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:task_manger/src/styles/colors.dart';

class CheckBoxListTile extends StatelessWidget {
  const CheckBoxListTile(
      {Key? key,
      required this.value,
      required this.title,
      required this.onChange})
      : super(key: key);
  final bool value;
  final String title;
  final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w200,
            color: Theme.of(context).colorScheme.onSurface),
      ),
      trailing: SizedBox(
        width: 51,
        height: 31,
        child: FlutterSwitch(
            toggleSize: 28,
            padding: 1,
            value: value,
            onToggle: onChange,
            inactiveSwitchBorder: Border.all(color: AppColors.aquamarine),
            activeSwitchBorder: Border.all(color: AppColors.aquamarine),
            activeColor: AppColors.aquamarine),
      ),
    );
  }
}
