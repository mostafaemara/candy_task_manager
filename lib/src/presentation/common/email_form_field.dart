import 'package:flutter/material.dart';
import 'package:task_manger/src/application/validators/auth_validators.dart';
import "package:task_manger/src/presentation/helpers/auth_validation_error_helper.dart";

class EmailFormField extends StatelessWidget {
  const EmailFormField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => emailValidator(value).translateForEmail(context),
      controller: controller,
    );
  }
}
