import 'package:flutter/material.dart';

import 'package:task_manger/src/helpers/auth_validation_error_helper.dart';
import 'package:task_manger/src/validators/auth_validators.dart';

class ConfirmPasswordFormField extends StatelessWidget {
  const ConfirmPasswordFormField(
      {Key? key, required this.controller, required this.passwordController})
      : super(key: key);
  final TextEditingController controller;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          confirmPasswordValidator(value, passwordController.text)
              .translateForConfirmPassword(context),
      controller: controller,
    );
  }
}
