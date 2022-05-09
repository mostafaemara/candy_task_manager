import 'package:flutter/material.dart';

import 'package:task_manger/src/helpers/auth_validation_error_helper.dart';
import 'package:task_manger/src/validators/auth_validators.dart';

class PassowrdFormField extends StatelessWidget {
  const PassowrdFormField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          passwordValidator(value).translateForPassword(context),
      controller: controller,
    );
  }
}
