import 'package:flutter/material.dart';

import 'package:task_manger/src/helpers/auth_validation_error_helper.dart';
import 'package:task_manger/src/validators/auth_validators.dart';

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
