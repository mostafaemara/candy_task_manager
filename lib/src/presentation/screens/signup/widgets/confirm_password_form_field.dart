import 'package:flutter/material.dart';
import 'package:task_manger/src/application/validators/auth_validators.dart';
import 'package:task_manger/src/presentation/helpers/auth_validation_error_helper.dart';

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
